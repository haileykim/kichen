Rails.application.routes.draw do

  get 'tags/index'

  root 'static_pages#home'

  resources :admins, only: :index
  
  namespace :admins do
    resources :recipes, except: [:new, :show, :destroy]
    resources :food_items, except: [:new, :show, :destroy]
    resources :comments, only: :index
    resources :users, only: [:index, :edit, :update, :destroy]
    resources :favorites
  end

  devise_for :users 

  devise_scope :user do
    get '/login/', to: 'devise/sessions#new', as: 'login'
    get '/signup', to: 'devise/registrations#new', as: 'signup'
    get '/settings', to: 'devise/registrations#edit', as: 'settings'
    get '/sign_in', to: 'devise/sessions#new'
  end

  resources :users

  resources :tags, only: [:index]
  resources :ingredients, only: [:autocomplete_food_item_name] do
    get :autocomplete_food_item_name, :on => :collection
  end

  resources :food_items

  resources :recipes do 
    resources :ingredients
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  get 'tags/:tag' => 'recipes#index', as: :tag
  get 'ingredients/:ingredient' => 'recipes#index', as: :ingredient

end

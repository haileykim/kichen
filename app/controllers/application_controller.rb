class ApplicationController < ActionController::Base

  around_filter :append_event_tracking_tags
  
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def mixpanel_distinct_id
    # current_visitor_id not defined. Fix me.
    # current_visitor_id
  end

  def mixpanel_name_tag
    current_user && current_user.email
  end


  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :first_name
  	devise_parameter_sanitizer.for(:sign_up) << :last_name
  	devise_parameter_sanitizer.for(:account_update) << :first_name
  	devise_parameter_sanitizer.for(:account_update) << :last_name
  end
end

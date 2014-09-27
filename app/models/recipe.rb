class Recipe < ActiveRecord::Base
  validates :name, :method, :serving, presence: true
  has_attached_file :image
  validates_attachment :image, 
    :content_type => { :content_type => ['image/jpeg', 'image/png']},
    :size => { :less_than => 5.megabyte }

  has_many :ingredients, dependent: :destroy
  has_many :food_items, through: :ingredients

  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: proc { |a| a[:food_item_name].blank? }


end

class Recipe < ActiveRecord::Base
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :fans, through: :favorites, source: :user
  has_many :ingredients, dependent: :destroy
  has_many :food_items, through: :ingredients
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :instructions, dependent: :destroy

  has_attached_file :image
  validates_attachment :image, 
    :content_type => { :content_type => ['image/jpeg', 'image/png']},
    :size => { :less_than => 5.megabyte }

  validates :name, presence: true
    
  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: proc { |a| a[:food_item_name].blank? }

  accepts_nested_attributes_for :instructions, allow_destroy: true, reject_if: proc { |a| a[:content].blank? }

  def self.tagged_with(name)
    Tag.find_by!(name: name).recipes
  end

  def self.with_ingredient(name)
    FoodItem.find_by!(name: name).recipes
  end

  def self.search(search)
    where(arel_table[:name].matches("%#{search}%"))
  end

  attr_reader :tag_tokens

  def tag_tokens=(tokens)
    self.tag_ids = Tag.ids_from_tokens(tokens)
  end

end

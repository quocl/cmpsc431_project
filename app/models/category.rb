class Category < ActiveRecord::Base
  belongs_to :category

  has_many :childcategories, :class_name => "Category"
  has_one :parentcategory, :class_name => "Category"
  has_many :sale_items
end

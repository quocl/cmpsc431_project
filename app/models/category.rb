class Category < ActiveRecord::Base
  belongs_to :category

  has_many :categories
  has_many :sale_items
end

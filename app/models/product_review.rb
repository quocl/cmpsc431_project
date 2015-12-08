class ProductReview < ActiveRecord::Base
	belongs_to :sale_items
	validates :rating,  :numericality => { :greater_than => 0, :less_than_or_equal_to => 5 } , presence: true
	validates :review_title, presence: true
	validates :review_content, presence: true
end

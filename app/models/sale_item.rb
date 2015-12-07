class SaleItem < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	validates :item_name, presence: true
    validates :item_price, presence: true, numericality: true
    validates :amount, presence: true, numericality: true
    validates :category_id, presence: true
    validates :item_location, presence: true
    validates_uniqueness_of :item_name, scope: [:user]
    has_many :order_items
    has_many :wishlist_items
    belongs_to :category
end

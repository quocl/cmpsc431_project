class SaleItem < ActiveRecord::Base
	belongs_to :user
	validates :user, presence: true
	validates :item_name, presence: true
    validates :item_price, presence: true
    validates_uniqueness_of :item_name, scope: [:user]
end

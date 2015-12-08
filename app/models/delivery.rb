class Delivery < ActiveRecord::Base
	belongs_to :user
	belongs_to :order
	has_one :address
	has_one :card
	validates :card_id, presence: true
	validates :address_id, presence: true
end

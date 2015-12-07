class Card < ActiveRecord::Base
	belongs_to :user 
	belongs_to :delivery
	validates :card_number, length: { is: 16 }, presence: true, :numericality => true
	validates :security_code, length: { is: 3 }, :numericality => true, presence: true
	validates :expiration, presence: true
	validates :name, presence: true
end

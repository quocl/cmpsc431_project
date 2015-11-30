class Card < ActiveRecord::Base
	belongs_to :user 
	belongs_to :delivery
	#validates :card_number, length: { is: 16 }
	#validates :card_number, :numericality => true
	#validates :security_code, :numericality => true
end

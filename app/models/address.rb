class Address < ActiveRecord::Base
validates :zipcode, length: { is: 5 }, numericality: { only_integer: true } , presence: true
validates :street , presence: true
validates :city , presence: true 
validates :addrType , presence: true
validates :name , presence: true

belongs_to :user
belongs_to :delivery
end

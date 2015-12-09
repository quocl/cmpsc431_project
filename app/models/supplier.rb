class Supplier < ActiveRecord::Base
  belongs_to :user
  validates :user_id,  presence: true
  validates :name, presence: true
  validates :address_id, presence: true
  validates :point_of_contact, presence: true
  validates :phone_number, numericality: true , length: { is: 10 }, presence: true
  validates :revenue, numericality: true , presence: true
  validates :company_category, presence: true
end

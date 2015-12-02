class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :addresses
  has_many :cards
  has_many :wishlists
  has_many :deliveries
  has_many :sale_items
  validates :email, :first_name, :last_name, :username, :usergroup, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end

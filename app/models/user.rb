class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :addresses
  has_many :cards
  has_many :wishlists
  has_many :deliveries
  has_many :sale_items
  has_many :ordered_items
  has_many :seller_reviews
  validates :email, :first_name, :last_name, :username, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end

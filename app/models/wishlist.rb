class Wishlist < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  validates :user_id, presence: true
  validates_uniqueness_of :name, scope: [:user_id]
end

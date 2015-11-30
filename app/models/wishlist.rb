class Wishlist < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  validates :user_id, presence: true
  validates_uniqueness_of :name, scope: [:user_id]
  has_many :wishlist_items
  has_many :sale_items, :through => :wishlist_items

  def subtotal
    wishlist_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end
private

  def update_subtotal
    self[:subtotal] = subtotal
  end

end

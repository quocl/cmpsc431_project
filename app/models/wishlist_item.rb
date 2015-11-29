class WishlistItem < ActiveRecord::Base
  belongs_to :sale_item
  belongs_to :wishlist
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :sale_item_present
  validate :wishlist_present

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      sale_item.item_price
    end
  end

  def total_price
    unit_price * quantity
  end

private
  def sale_item_present
    if sale_item.nil?
      errors.add(:sale_item, "is not valid or is not active.")
    end
  end

  def wishlist_present
    if wishlist.nil?
      errors.add(:wishlist, "is not a valid wishlist.")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end

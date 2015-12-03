class WishlistItem < ActiveRecord::Base
  belongs_to :sale_item
  belongs_to :wishlist
  validate :sale_item_present
  validate :wishlist_present
  validates_uniqueness_of :sale_item_id, scope: [:wishlist_id]


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

end

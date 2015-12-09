class OrderItem < ActiveRecord::Base
  belongs_to :sale_item
  belongs_to :order
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0}
  validate :sale_item_present
  validate :order_present
  validate :sale_item_enough

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

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end

  def sale_item_enough
    amount = SaleItem.find(sale_item.id).amount
    if quantity > amount
     errors.add(:quantity, "cannot be supplied.")
    end
  end
end
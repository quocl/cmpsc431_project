class AddSubtotalToWishlists < ActiveRecord::Migration
  def change
    add_column :wishlists, :subtotal, :decimal, precision: 10, scale: 2
  end
end

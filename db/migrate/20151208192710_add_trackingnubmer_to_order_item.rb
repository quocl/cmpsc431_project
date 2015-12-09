class AddTrackingnubmerToOrderItem < ActiveRecord::Migration
  def change
    add_column :order_items, :trackingnumber, :string
  end
end

class AddTrackingnumberToOrderItem < ActiveRecord::Migration
  def change
    add_column :ordered_items, :trackingnumber, :string
  end
end

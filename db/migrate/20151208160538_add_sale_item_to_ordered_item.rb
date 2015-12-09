class AddSaleItemToOrderedItem < ActiveRecord::Migration
  def change
    add_reference :ordered_items, :sale_item, index: true, foreign_key: true
  end
end

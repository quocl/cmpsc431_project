class AddOrderedItemIdToSaleItem < ActiveRecord::Migration
  def change
    add_reference :sale_items, :ordered_item, index: true, foreign_key: true
  end	
end

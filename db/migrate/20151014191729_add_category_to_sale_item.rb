class AddCategoryToSaleItem < ActiveRecord::Migration
  def change
    add_reference :sale_items, :category, index: true, foreign_key: true
  end
end

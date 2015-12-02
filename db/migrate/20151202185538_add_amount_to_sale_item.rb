class AddAmountToSaleItem < ActiveRecord::Migration
  def change
    add_column :sale_items, :amount, :interger
  end
end

class ChangeUserIdInSaleItem < ActiveRecord::Migration
  def change
  	change_column :sale_items, :user_id, :integer
  end
end

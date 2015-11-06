class CreateSaleItems < ActiveRecord::Migration
  def change
    create_table :sale_items do |t|
      t.text :user
      t.string :item_name
      t.text :item_description
      t.float :item_price
      t.string :item_location

      t.timestamps null: false
    end
  end
end

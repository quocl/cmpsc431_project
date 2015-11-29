class CreateWishlistItems < ActiveRecord::Migration
  def change
    create_table :wishlist_items do |t|
      t.references :sale_item, index: true, foreign_key: true
      t.references :wishlist, index: true, foreign_key: true
      t.decimal :unit_price, precision: 10, scale: 2
      t.integer :quantity
      t.decimal :total_price, precision: 10, scale: 2

      t.timestamps null: false
    end
  end
end

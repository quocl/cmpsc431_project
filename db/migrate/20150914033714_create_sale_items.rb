class CreateSaleItems < ActiveRecord::Migration
  def change
    create_table :sale_items do |t|
      t.string :name
      t.text :description
      t.double :price
      t.string :location

      t.timestamps null: false
    end
  end
end

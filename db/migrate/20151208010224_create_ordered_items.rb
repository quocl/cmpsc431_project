class CreateOrderedItems < ActiveRecord::Migration
  def change
    create_table :ordered_items do |t|
      t.references :delivery, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end

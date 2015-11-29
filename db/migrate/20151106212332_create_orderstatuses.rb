class CreateOrderstatuses < ActiveRecord::Migration
  def change
    create_table :orderstatuses do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

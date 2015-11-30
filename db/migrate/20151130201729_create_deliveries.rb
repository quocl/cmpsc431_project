class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.references :order
      t.references :user
      t.references :address
      t.references :card
      t.string :trackingnumber 
      t.timestamps null: false
    end
  end
end

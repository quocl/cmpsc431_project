class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.references :order, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :address, index: true, foreign_key: true
      t.references :card, index: true, foreign_key: true
      t.string :trackingnumber

      t.timestamps null: false
    end
  end
end

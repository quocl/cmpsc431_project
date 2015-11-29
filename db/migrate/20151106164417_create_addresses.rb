class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :user_id, null: false, foreign_key: true
      t.text :street, index: true, null: false
      t.string :city, null: false
      t.integer :zipcode, null: false
      t.string :addrType, null: false

      t.timestamps null: false
    end
  end
end

class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.integer :address_id
      t.string :point_of_contact
      t.integer :phone_number
      t.string :company_category
      t.decimal :revenue

      t.timestamps null: false
    end
  end
end

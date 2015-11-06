class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.string :user_id, foreign_key: true

      t.timestamps null: false
    end
  end
end

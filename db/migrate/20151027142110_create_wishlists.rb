class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end

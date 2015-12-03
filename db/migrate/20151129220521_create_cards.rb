class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :number
      t.string :name
      t.date :expiration
      t.string :card_type
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end

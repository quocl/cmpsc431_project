class ChangeCard < ActiveRecord::Migration
  def change
  	add_column :cards, :security_code, :string
  	change_column :cards, :number, :integer
  	rename_column :cards, :number, :card_number
  end
end

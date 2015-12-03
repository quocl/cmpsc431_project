class ChangeCardPart2 < ActiveRecord::Migration
  def change
  	change_column :cards, :card_number, :string
  end
end

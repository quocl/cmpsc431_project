class ChangeTrackingnumberInDelivery < ActiveRecord::Migration
  def change
  	rename_column :deliveries, :trackingnumber, :shipped
  	change_column :deliveries, :shipped, :integer
  end
end

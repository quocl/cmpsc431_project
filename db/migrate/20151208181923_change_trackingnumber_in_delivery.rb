class ChangeTrackingnumberInDelivery < ActiveRecord::Migration
  def change
  	rename_column :deliveries, :trackingnumber, :shipped
  end
end

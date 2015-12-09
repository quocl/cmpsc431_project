class AddShippingMethodToDelivery < ActiveRecord::Migration
  def change
    add_column :deliveries, :shipping_method, :string
  end
end

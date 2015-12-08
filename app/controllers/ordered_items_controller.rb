class OrderedItemsController < ApplicationController
  
  def delete

  end

  def create
  	
  end
	
  def destroy
  	@delivery = OrderedItem.find(params[:id]).delivery
  	@order = Order.find(@delivery.order_id)
    @sale_items = current_sale_items
  end  
end

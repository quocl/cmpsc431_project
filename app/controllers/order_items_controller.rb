class OrderItemsController < ApplicationController
  def create
    @order = current_order
    if order_item_params[:quantity].to_i > current_sale_items.find(order_item_params[:sale_item_id]).amount
      flash[:notice] = 'Successfully checked in'
      redirect_to sale_items_path
    else
      if !@order.order_items.find_by sale_item_id: order_item_params[:sale_item_id]
        @order_item = @order.order_items.new(order_item_params)
        @order.save
        session[:order_id] = @order.id
        @order_item = @order.order_items.find_by sale_item_id: order_item_params[:sale_item_id]
      else
        if order_item_params[:quantity].to_i + @order_item.quantity > current_sale_items.find(order_item_params[:sale_item_id]).amount
          flash[:notice] = 'Successfully checked in'
          redirect_to sale_items_path
        else
          @order_item.quantity = @order_item.quantity + order_item_params[:quantity].to_i
          @order_item.save
          @order.save
        end
      end
    end
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

private

  def order_item_params
    params.require(:order_item).permit(:quantity, :sale_item_id)
  end

end

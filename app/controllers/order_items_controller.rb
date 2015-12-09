class OrderItemsController < ApplicationController
  def display_order_report
      time_range = (1.weeks.ago..Time.now)
      @all_order_records = OrderItem.where(:created_at => time_range)
  end

  def create
    @order = current_order
      if !@order.order_items.find_by sale_item_id: order_item_params[:sale_item_id]
        @order_item = @order.order_items.new(order_item_params)
        @order.save
        session[:order_id] = @order.id
      else
        @order_item = @order.order_items.find_by sale_item_id: order_item_params[:sale_item_id]
        if order_item_params[:quantity].to_i + @order_item.quantity > current_sale_items.find(order_item_params[:sale_item_id]).amount
          @order_item.errors.add(:quantity, "cannot be supplied.")
        else
          @order_item.quantity = @order_item.quantity + order_item_params[:quantity].to_i
          @order_item.save
          @order.save
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

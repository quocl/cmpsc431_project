class OrderedItemsController < ApplicationController
  

  def create
  end
	
  def edit
  	@ordered_item = OrderedItem.find(params[:id])
  	@delivery = @ordered_item.delivery
  	@sale_items = current_sale_items

  end  

    def update
    @ordered_item = OrderedItem.find(params[:id])
    respond_to do |format|
      if @ordered_item.update(ordered_item_params)
      	if Delivery.find(@ordered_item.delivery_id).shipped.nil?
      		a = Delivery.find(@ordered_item.delivery_id)
      		a.shipped = 1
      		a.save
      	else
      		a = Delivery.find(@ordered_item.delivery_id)
      		a.shipped += 1
      		a.save
      	end
      	b = OrderItem.find_by sale_item_id: @ordered_item.sale_item_id
      	b.trackingnumber = @ordered_item.trackingnumber
      	b.save
        format.html { redirect_to profile_url, notice: 'Order was successfully fulfilled.' }
        format.json { render :show, status: :updated, location: profile_url }
      else
        format.html { render :new }
        format.json { render json: @delivery.errors, status: :unprocessable_entity }
      end
    end
  end

    private


    # Never trust parameters from the scary internet, only allow the white list through.
    def ordered_item_params
      params.require(:ordered_item).permit(:delivery_id, :user_id, :quantity, :trackingnumber, :sale_item_id)
    end
end

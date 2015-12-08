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

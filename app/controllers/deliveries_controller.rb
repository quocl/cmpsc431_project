class DeliveriesController < ApplicationController
  before_filter :authenticate_user!, :only => [:edit, :update, :destroy, :create]
  before_action :set_delivery, only: [:show, :edit, :update, :destroy]

  # GET /deliveries
  # GET /deliveries.json
  def index
    @deliveries = current_user.deliveries
  end

  # GET /deliveries/1
  # GET /deliveries/1.json
  def show
    @delivery = Delivery.find(params[:id])
    @order = Order.find(@delivery.order_id)
    @sale_items = current_sale_items
  end

  # GET /deliveries/new
  def new
    @order = current_order
    @delivery = Delivery.new
    @sale_items = current_sale_items
    @address_selected = nil
    @card_selected = nil
  end

  # GET /deliveries/1/edit
  def edit
    @delivery = Delivery.find(params[:id])
    @order = Order.find(@delivery.order_id)
    @sale_items = current_sale_items
  end

  # POST /deliveries
  # POST /deliveries.json
  def create
    @order = current_order
    @delivery = Delivery.new(delivery_params)
    @delivery.order_id = @order.id
    @delivery.user_id = current_user.id
    @addresses = current_user.addresses
    @cards = current_user.cards
    
  respond_to do |format|
      if @delivery.save
        @order.order_items.each do |order_item|
          ordered_item = OrderedItem.new
          ordered_item.sale_item = SaleItem.find(order_item.sale_item_id)
          ordered_item.sale_item_id = order_item.sale_item_id
          ordered_item.delivery_id = @delivery.id
          ordered_item.quantity = order_item.quantity
          User.find(SaleItem.find(order_item.sale_item_id).user_id).ordered_items << ordered_item
        end
        @order = Order.new
        session[:order_id] = @order.id
        current_order = @order
        format.html { redirect_to profile_url, notice: 'Order was successfully placed.' }
        format.json { render :show, status: :created, location: profile_url }
      else
        format.html { render :new }
        format.json { render json: @delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deliveries/1
  # PATCH/PUT /deliveries/1.json
  def update
    respond_to do |format|
      if @delivery.save
        format.html { redirect_to profile_url, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :updated, location: profile_url }
      else
        format.html { render :new }
        format.json { render json: @delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deliveries/1
  # DELETE /deliveries/1.json
  def destroy
    @delivery.destroy
    respond_to do |format|
      format.html { redirect_to profile_url, notice: 'Order was successfully canceled.' }
      format.json { head :no_content }
    end
  end

  def update_address
    @address_selected = Address.find(params[:add_id])
  end

  def update_card
    @card_selected = Card.find(params[:c_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery
      @delivery = Delivery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def delivery_params
      params.require(:delivery).permit(:order_id, :user_id, :address_id, :card_id, :shipped)
    end
end

class SaleItemsController < ApplicationController
  before_action :set_sale_item, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :only => [:edit, :update, :destroy, :create]
  # GET /sale_items
  # GET /sale_items.json
  def index
    @sale_items = SaleItem.all
    @order_item = current_order.order_items.new
    
  end

  # GET /sale_items/1
  # GET /sale_items/1.json
  def show
  end

  # GET /sale_items/new
  def new
    @sale_item = SaleItem.new
  end

  # GET /sale_items/1/edit
  def edit
  end

  # POST /sale_items
  # POST /sale_items.json
  def create
    @sale_item = SaleItem.new(item_name: params[:sale_item][:item_name],
                              item_description: params[:sale_item][:item_description],
                              item_price: params[:sale_item][:item_price],
                              item_location: params[:sale_item][:item_location],
                              user_id: current_user.email)

    respond_to do |format|
      if @sale_item.save
        format.html { redirect_to @sale_item, notice: 'Sale item was successfully created.' }
        format.json { render :show, status: :created, location: @sale_item }
      else
        format.html { render :new }
        format.json { render json: @sale_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sale_items/1
  # PATCH/PUT /sale_items/1.json
  def update
    respond_to do |format|
      if @sale_item.update(sale_item_params)
        format.html { redirect_to @sale_item, notice: 'Sale item was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale_item }
      else
        format.html { render :edit }
        format.json { render json: @sale_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sale_items/1
  # DELETE /sale_items/1.json
  def destroy
    @sale_item.destroy
    respond_to do |format|
      format.html { redirect_to sale_items_url, notice: 'Sale item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale_item
      @sale_item = SaleItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_item_params
      params.require(:sale_item).permit(:user_id, :item_name, :item_description, :item_price, :item_location)
    end
end

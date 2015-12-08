class WishlistsController < ApplicationController
  before_action :set_wishlist, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :only => [:edit, :update, :destroy, :create]
  # GET /wishlists
  # GET /wishlists.json
  def index
    if current_user.present?
      @wishlists1 = current_user.wishlists
    end
    @wishlists2 = Wishlist.where("shared =?", 'public')
    @users = current_users
  end

  # GET /wishlists/1
  # GET /wishlists/1.json
  def show
    @current_wishlist = Wishlist.find(params[:id])
    @wishlist_items = @current_wishlist.wishlist_items
    @order_item = current_order.order_items.new
    @users = User.all
    
  end

  # GET /wishlists/new
  def new
    @wishlist = Wishlist.new
  end

  # GET /wishlists/1/edit
  def edit
  end

  # POST /wishlists
  # POST /wishlists.json
  def create
    @wishlist = Wishlist.new(name: params[:wishlist][:name],
                       user_id: current_user.email,
                       shared: params[:wishlist][:shared])
    current_user.wishlists << @wishlist
    respond_to do |format|
      if @wishlist.save
        format.html { redirect_to @wishlist, notice: 'Wishlist was successfully created.' }
        format.json { render :index, status: :created, location: @wishlist }
      else
        format.html { render :new }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wishlists/1
  # PATCH/PUT /wishlists/1.json
  def update
    respond_to do |format|
      if @wishlist.update(wishlist_params)
        format.html { redirect_to @wishlist, notice: 'Wishlist was successfully updated.' }
        format.json { render :index, status: :ok, location: @wishlist }
      else
        format.html { render :edit }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wishlists/1
  # DELETE /wishlists/1.json
  def destroy
    @wishlist.destroy
    respond_to do |format|
      format.html { redirect_to wishlists_url, notice: 'Wishlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource)
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wishlist
      @wishlist = Wishlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wishlist_params
      params.require(:wishlist).permit(:name, :user_id, :shared)
    end

end

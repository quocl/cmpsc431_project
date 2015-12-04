class WishlistItemsController < ApplicationController
  def create
    @wishlist = current_user.wishlists.find(wishlist_item_params[:wishlist_id])
    if !@wishlist.wishlist_items.find_by sale_item_id: wishlist_item_params[:sale_item_id]
      @wishlist_item = @wishlist.wishlist_items.new(wishlist_item_params)
      @wishlist.save
    else
      @wishlist_item = @wishlist.wishlist_items.find_by sale_item_id: wishlist_item_params[:sale_item_id]
      @wishlist_item.save
      @wishlist.save
    end

  end

  def update
    @wishlist = current_user.wishlists.find(wishlist_item_params[:wishlist_id])
    @wishlist_item = @wishlist.wishlist_items.find(params[:id])
    @wishlist_item.update_attributes(wishlist_item_params)
    @wishlist_items = @wishlist.wishlist_items
  end

  def destroy
    @wishlist = current_user.wishlists.find(params[:wishlist_id])
    @wishlist_item = @wishlist.wishlist_items.find(params[:id])
    @wishlist_item.destroy
    @wishlist_items = @wishlist.wishlist_items
  end

private

  def wishlist_item_params
    params.require(:wishlist_item).permit(:sale_item_id, :wishlist_id)
  end

end

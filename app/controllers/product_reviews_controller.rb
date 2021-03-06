class ProductReviewsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :edit, :update, :destroy, :create]
  def index
    @product_reviews = ProductReview.where(sale_item_id: params[:format])
  end

  # GET /productreviews/1
  # GET /productreviews/1.json
  def show
  end

  # GET /productreviews/new
  def new
    @product_review = ProductReview.new
    @sale_item_id = params[:format]
  end

  # GET /productreviews/1/edit
  def edit
  end

  # POST /product_reviews
  # POST /product_reviews.json
  def create
    @product_review = ProductReview.new(product_review_params)
    @product_review.user_id = current_user.id

    respond_to do |format|
      if @product_review.save
        SaleItem.find(@product_review.sale_item_id).product_reviews << @product_review
        format.html { redirect_to @product_review, notice: 'Product review was successfully created.' }
        format.json { render :show, status: :created, location: @product_review}
      else
        format.html { render :new }
        format.json { render json: @product_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    product_review = ProductReview.find(params[:id])
    SaleItem.find(product_review.sale_item_id).product_reviews.find(params[:id]).destroy
    product_review.destroy
    respond_to do |format|
      format.html { redirect_to sale_items_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def product_review_params
      params.require(:product_review).permit(:sale_item_id, :item_name, :rating, :review_title, :review_content, :user_id)
    end

end

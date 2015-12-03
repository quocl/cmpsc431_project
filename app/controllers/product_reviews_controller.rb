class ProductReviewsController < ApplicationController

  def index
    #@idToGet = params[:id]
    @product_reviews = ProductReview.where(item_id: params[:sale_item_id])
  end

  # GET /productreviews/1
  # GET /productreviews/1.json
  def show
    @idToGet = params[:id]
    @product_review = ProductReview.where(id: @idToGet)

  end

  # GET /productreviews/new
  def new
    @idToGet = params[:id]
    @product_review = ProductReview.new
  end

  # GET /productreviews/1/edit
  def edit
  end

  # POST /product_reviews
  # POST /product_reviews.json
  def create
    @product_review = ProductReview.new(product_review_params)

    respond_to do |format|
      if @product_review.save
        format.html { redirect_to @product_review, notice: 'Product review was successfully created.' }
        format.json { render :show, status: :created, location: @product_review}
      else
        format.html { render :new }
        format.json { render json: @product_review.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def product_review_params
      params.require(:product_review).permit(:item_id, :item_name, :rating, :review_title, :review_content)
    end

end

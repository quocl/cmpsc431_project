class SellerReviewsController < ApplicationController

  def index
    @seller_reviews = SellerReview.where(seller_id: params[:sale_item_id])
  end

  # GET /productreviews/1
  # GET /productreviews/1.json
  def show
  	@seller_review = SellerReview.new
  end

  # GET /productreviews/new
  def new
    @seller_review = SellerReview.new
  end

  # GET /productreviews/1/edit
  def edit
  end

  # POST /product_reviews
  # POST /product_reviews.json
  def create
    @seller_review = SellerReview.new(seller_review_params, seller_id: params[:sale_item_id])

    respond_to do |format|
      if @seller_review.save
        format.html { redirect_to @seller_review, notice: 'Seller review was successfully created.' }
        format.json { render :show, status: :created, location: @seller_review }
      else
        format.html { render :new }
        format.json { render json: @seller_review.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def seller_review_params
      params.require(:seller_review).permit(:seller_id, :reviewer_id, :rating, :review_title, :review_content)

    end

end

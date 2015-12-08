class SellerReviewsController < ApplicationController

  def index
    @seller_reviews = SellerReview.where(seller_id: SaleItem.find(params[:format]).user_id)
  end

  # GET /sellerreviews/1
  # GET /sellerreviews/1.json
  def show
  end

  # GET /sellerreviews/new
  def new
    @seller_review = SellerReview.new
    @sale_item_id = params[:format]
  end

  # GET /sellerreviews/1/edit
  def edit
  end

  # POST /seller_reviews
  # POST /seller_reviews.json
  def create
    @seller_review = SellerReview.new(seller_review_params)
    @seller_review.reviewer_id = current_user.id


    respond_to do |format|
      if @seller_review.save
        format.html { redirect_to @seller_review, notice: 'Seller review was successfully created.' }
        format.json { render :show, status: :created, location: @seller_review}
      else
        format.html { render :new }
        format.json { render json: @seller_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    sellerreviews = SellerReview.find(params[:id])
    sellerreviews.destroy
    respond_to do |format|
      format.html { redirect_to sale_item_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def seller_review_params
      params.require(:seller_review).permit(:seller_id, :reviewer_id, :rating, :review_title, :review_content)

    end

end

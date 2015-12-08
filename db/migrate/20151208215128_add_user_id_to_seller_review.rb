class AddUserIdToSellerReview < ActiveRecord::Migration
  def change
    add_reference :seller_reviews, :user, index: true, foreign_key: true
  end
end

class AddUserIdToProductReview < ActiveRecord::Migration
  def change
    add_reference :product_reviews, :user, index: true, foreign_key: true
  end
end

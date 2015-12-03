class CreateSellerReviews < ActiveRecord::Migration
  def change
    create_table :seller_reviews do |t|
      t.string :seller_id
      t.string :reviewer_id
      t.float :rating
      t.text :review_title
      t.text :review_content
      t.timestamps null: false
    end
  end
end

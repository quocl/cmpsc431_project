class CreateProductReviews < ActiveRecord::Migration
  def change
    create_table :product_reviews do |t|
      t.references :sale_item, index: true, foreign_key: true
      t.string :item_name
      t.float :rating
      t.text :review_title
      t.text :review_content
      t.timestamps null: false
    end
  end
end

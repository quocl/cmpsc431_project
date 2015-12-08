# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151208160538) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.text     "street",     null: false
    t.string   "city",       null: false
    t.integer  "zipcode",    null: false
    t.string   "addrType",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  add_index "addresses", ["street"], name: "index_addresses_on_street"

  create_table "cards", force: :cascade do |t|
    t.string   "card_number"
    t.string   "name"
    t.date     "expiration"
    t.string   "card_type"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "security_code"
  end

  add_index "cards", ["user_id"], name: "index_cards_on_user_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "categories", ["category_id"], name: "index_categories_on_category_id"

  create_table "deliveries", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "user_id"
    t.integer  "address_id"
    t.integer  "card_id"
    t.string   "trackingnumber"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "deliveries", ["address_id"], name: "index_deliveries_on_address_id"
  add_index "deliveries", ["card_id"], name: "index_deliveries_on_card_id"
  add_index "deliveries", ["order_id"], name: "index_deliveries_on_order_id"
  add_index "deliveries", ["user_id"], name: "index_deliveries_on_user_id"

  create_table "order_items", force: :cascade do |t|
    t.integer  "sale_item_id"
    t.integer  "order_id"
    t.decimal  "unit_price",   precision: 12, scale: 2
    t.integer  "quantity"
    t.decimal  "total_price",  precision: 12, scale: 2
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"
  add_index "order_items", ["sale_item_id"], name: "index_order_items_on_sale_item_id"

  create_table "ordered_items", force: :cascade do |t|
    t.integer  "delivery_id"
    t.integer  "user_id"
    t.integer  "quantity"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "sale_item_id"
  end

  add_index "ordered_items", ["delivery_id"], name: "index_ordered_items_on_delivery_id"
  add_index "ordered_items", ["sale_item_id"], name: "index_ordered_items_on_sale_item_id"
  add_index "ordered_items", ["user_id"], name: "index_ordered_items_on_user_id"

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",        precision: 12, scale: 2
    t.decimal  "tax",             precision: 12, scale: 2
    t.decimal  "shipping",        precision: 12, scale: 2
    t.decimal  "total",           precision: 12, scale: 2
    t.integer  "order_status_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "orders", ["order_status_id"], name: "index_orders_on_order_status_id"

  create_table "orderstatuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_reviews", force: :cascade do |t|
    t.integer  "sale_item_id"
    t.string   "item_name"
    t.float    "rating"
    t.text     "review_title"
    t.text     "review_content"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "product_reviews", ["sale_item_id"], name: "index_product_reviews_on_sale_item_id"

  create_table "sale_items", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "item_name"
    t.text     "item_description"
    t.float    "item_price"
    t.string   "item_location"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "category_id"
    t.integer  "amount"
    t.integer  "ordered_item_id"
  end

  add_index "sale_items", ["category_id"], name: "index_sale_items_on_category_id"
  add_index "sale_items", ["ordered_item_id"], name: "index_sale_items_on_ordered_item_id"

  create_table "seller_reviews", force: :cascade do |t|
    t.string   "seller_id"
    t.string   "reviewer_id"
    t.float    "rating"
    t.text     "review_title"
    t.text     "review_content"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.integer  "usergroup"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "wishlist_items", force: :cascade do |t|
    t.integer  "sale_item_id"
    t.integer  "wishlist_id"
    t.decimal  "unit_price",   precision: 12, scale: 2
    t.integer  "quantity"
    t.decimal  "total_price",  precision: 10, scale: 2
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "wishlist_items", ["sale_item_id"], name: "index_wishlist_items_on_sale_item_id"
  add_index "wishlist_items", ["wishlist_id"], name: "index_wishlist_items_on_wishlist_id"

  create_table "wishlists", force: :cascade do |t|
    t.string   "user_id"
    t.string   "name"
    t.string   "shared"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.decimal  "subtotal",   precision: 10, scale: 2
  end

  add_index "wishlists", ["user_id"], name: "index_wishlists_on_user_id"

end

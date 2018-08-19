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

ActiveRecord::Schema.define(version: 20180819131251) do

  create_table "customer_details", force: :cascade do |t|
    t.string "shopify_customer_id"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.integer "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_customer_details_on_shop_id"
    t.index ["shopify_customer_id", "shop_id"], name: "index_customer_details_on_shopify_customer_id_and_shop_id"
  end

  create_table "loyalty_points", force: :cascade do |t|
    t.string "order_number"
    t.float "points"
    t.integer "customer_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_detail_id"], name: "index_loyalty_points_on_customer_detail_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "shopify_domain", null: false
    t.string "shopify_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true
  end

end

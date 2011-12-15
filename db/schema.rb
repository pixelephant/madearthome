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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111214131001) do

  create_table "categories", :force => true do |t|
    t.integer  "parent_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "shipping_address_id"
    t.integer  "invoice_address_id"
    t.integer  "user_id"
    t.text     "basket_serialization"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.integer  "product_id"
    t.string   "image"
    t.string   "alt"
    t.boolean  "default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "short_description"
    t.text     "long_description"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", :force => true do |t|
    t.string   "property_name"
    t.integer  "property_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties_to_products", :force => true do |t|
    t.integer  "property_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "property_categories", :force => true do |t|
    t.string   "category_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_addresses", :force => true do |t|
    t.integer  "user_id"
    t.string   "zip"
    t.string   "city"
    t.string   "street"
    t.string   "additional"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wishlist_items", :force => true do |t|
    t.integer  "wishlist_id"
    t.integer  "product_id"
    t.boolean  "sold"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wishlists", :force => true do |t|
    t.string   "custom_url"
    t.integer  "user_id"
    t.boolean  "public"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

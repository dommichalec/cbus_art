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

ActiveRecord::Schema.define(version: 20160414133833) do

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pieces", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "medium"
    t.string   "size"
    t.decimal  "rental_price_per_day"
    t.decimal  "rental_price_per_week"
    t.decimal  "rental_price_per_month"
    t.decimal  "sale_price"
    t.boolean  "available"
    t.boolean  "sold"
    t.integer  "city_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "pieces", ["city_id"], name: "index_pieces_on_city_id"

  create_table "registrations", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "phone_number",           limit: 10
    t.text     "message"
    t.boolean  "interested_in_rental"
    t.boolean  "interested_in_purchase"
    t.integer  "piece_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "neighborhood"
    t.integer  "zip_code"
    t.string   "organization"
  end

  add_index "registrations", ["piece_id"], name: "index_registrations_on_piece_id"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "portfolio_url"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end

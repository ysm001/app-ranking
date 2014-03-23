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

ActiveRecord::Schema.define(version: 20140323050525) do

  create_table "app_items", force: true do |t|
    t.integer  "ranking_id",                                  null: false
    t.integer  "category_id",                                 null: false
    t.integer  "publisher_id",                                null: false
    t.integer  "market_id",                                   null: false
    t.integer  "app_item_id"
    t.string   "name",            limit: 256,                 null: false
    t.string   "icon",            limit: 256
    t.string   "version",         limit: 32
    t.datetime "released_on"
    t.datetime "last_updated_on"
    t.integer  "size"
    t.boolean  "iap",                         default: false
  end

  add_index "app_items", ["app_item_id"], name: "fk_application_application1_idx", using: :btree
  add_index "app_items", ["category_id"], name: "fk_application_category1_idx", using: :btree
  add_index "app_items", ["id"], name: "id_UNIQUE", unique: true, using: :btree
  add_index "app_items", ["market_id"], name: "fk_application_market1_idx", using: :btree
  add_index "app_items", ["publisher_id"], name: "fk_application_publisher1_idx", using: :btree
  add_index "app_items", ["ranking_id"], name: "fk_application_ranking_idx", using: :btree

  create_table "categories", force: true do |t|
    t.integer "category_id"
    t.integer "market_id",              null: false
    t.string  "name",                   null: false
    t.string  "code",        limit: 32, null: false
  end

  add_index "categories", ["category_id"], name: "fk_category_category1_idx", using: :btree
  add_index "categories", ["id"], name: "id_UNIQUE", unique: true, using: :btree
  add_index "categories", ["market_id"], name: "fk_category_market1_idx", using: :btree

  create_table "countries", force: true do |t|
    t.string "code", limit: 16,  null: false
    t.string "name", limit: 128, null: false
  end

  add_index "countries", ["id"], name: "id_UNIQUE", unique: true, using: :btree

  create_table "currencies", force: true do |t|
    t.integer "country_id",            null: false
    t.string  "name",       limit: 32, null: false
    t.string  "code",       limit: 16
    t.string  "symbol",     limit: 16
  end

  add_index "currencies", ["country_id"], name: "fk_currency_language1_idx", using: :btree
  add_index "currencies", ["id"], name: "id_UNIQUE", unique: true, using: :btree

  create_table "descriptions", force: true do |t|
    t.integer "national_id", null: false
    t.text    "text",        null: false
  end

  add_index "descriptions", ["id"], name: "id_UNIQUE", unique: true, using: :btree
  add_index "descriptions", ["national_id"], name: "fk_description_national1_idx", using: :btree

  create_table "device_has_app_items", force: true do |t|
    t.integer "device_id",   null: false
    t.integer "app_item_id", null: false
  end

  add_index "device_has_app_items", ["app_item_id"], name: "fk_device_has_application_application1_idx", using: :btree
  add_index "device_has_app_items", ["device_id"], name: "fk_device_has_application_device1_idx", using: :btree

  create_table "devices", force: true do |t|
    t.string "name", null: false
  end

  add_index "devices", ["id"], name: "id_UNIQUE", unique: true, using: :btree

  create_table "feeds", force: true do |t|
    t.integer "market_id",            null: false
    t.string  "name",      limit: 32, null: false
    t.string  "code",      limit: 32, null: false
  end

  add_index "feeds", ["id"], name: "id_UNIQUE", unique: true, using: :btree
  add_index "feeds", ["market_id"], name: "fk_feed_market1_idx", using: :btree

  create_table "languages", force: true do |t|
    t.string  "name",                  null: false
    t.string  "code",       limit: 32, null: false
    t.integer "country_id",            null: false
  end

  add_index "languages", ["id"], name: "id_UNIQUE", unique: true, using: :btree

  create_table "markets", force: true do |t|
    t.string "name", limit: 32, null: false
    t.string "code", limit: 16, null: false
  end

  add_index "markets", ["id"], name: "id_UNIQUE", unique: true, using: :btree

  create_table "nationals", force: true do |t|
    t.integer "app_item_id", null: false
    t.integer "country_id",  null: false
  end

  add_index "nationals", ["app_item_id"], name: "fk_language_application1_idx", using: :btree
  add_index "nationals", ["country_id"], name: "fk_national_language1_idx", using: :btree
  add_index "nationals", ["id"], name: "id_UNIQUE", unique: true, using: :btree

  create_table "prices", force: true do |t|
    t.integer "national_id", null: false
    t.integer "value",       null: false
  end

  add_index "prices", ["id"], name: "id_UNIQUE", unique: true, using: :btree
  add_index "prices", ["national_id"], name: "fk_price_national1_idx", using: :btree

  create_table "publishers", force: true do |t|
    t.string "name", limit: 64, null: false
  end

  add_index "publishers", ["id"], name: "id_UNIQUE", unique: true, using: :btree

  create_table "rankings", force: true do |t|
    t.integer  "feeds_id",        null: false
    t.integer  "country_id",      null: false
    t.datetime "last_updated_on", null: false
  end

  add_index "rankings", ["country_id"], name: "fk_ranking_country1_idx", using: :btree
  add_index "rankings", ["feeds_id"], name: "fk_ranking_feed1_idx", using: :btree
  add_index "rankings", ["id"], name: "id_UNIQUE", unique: true, using: :btree

  create_table "rates", force: true do |t|
    t.integer "value",       null: false
    t.integer "app_item_id"
  end

  add_index "rates", ["id"], name: "id_UNIQUE", unique: true, using: :btree

end

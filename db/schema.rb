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

ActiveRecord::Schema.define(version: 20160811200816) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "order_statuses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "orderings", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "quantity"
    t.integer  "size_id"
    t.index ["order_id"], name: "index_orderings_on_order_id", using: :btree
    t.index ["product_id"], name: "index_orderings_on_product_id", using: :btree
    t.index ["size_id"], name: "index_orderings_on_size_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.integer  "order_status_id"
    t.index ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "color"
    t.string   "style"
    t.integer  "price"
    t.string   "image"
    t.string   "materials"
    t.text     "description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "category"
    t.string   "product_image_id"
  end

  create_table "promos", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "promo_image_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "refile_attachments", force: :cascade do |t|
    t.integer  "oid",        null: false
    t.string   "namespace",  null: false
    t.datetime "created_at"
    t.index ["namespace"], name: "index_refile_attachments_on_namespace", using: :btree
    t.index ["oid"], name: "index_refile_attachments_on_oid", using: :btree
  end

  create_table "shippings", force: :cascade do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shippings_on_user_id", using: :btree
  end

  create_table "sizes", force: :cascade do |t|
    t.string   "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizings", force: :cascade do |t|
    t.integer  "size_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "quantity"
    t.index ["product_id"], name: "index_sizings_on_product_id", using: :btree
    t.index ["size_id"], name: "index_sizings_on_size_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "role",            default: "guest"
  end

  add_foreign_key "orderings", "orders"
  add_foreign_key "orderings", "products"
  add_foreign_key "shippings", "users"
  add_foreign_key "sizings", "products"
  add_foreign_key "sizings", "sizes"
end

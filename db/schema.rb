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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20160809194507) do
=======
ActiveRecord::Schema.define(version: 20160809184417) do
>>>>>>> 48958a8df0f0fd564b0460688b860f617effa802

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orderings", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "unit_price"
    t.integer  "quantity"
    t.integer  "total_price"
    t.index ["order_id"], name: "index_orderings_on_order_id", using: :btree
    t.index ["product_id"], name: "index_orderings_on_product_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "price"
    t.integer  "quantity"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "order_status_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "color"
    t.string   "style"
    t.integer  "price"
    t.string   "image"
    t.string   "materials"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "category"
  end

  create_table "sizes", force: :cascade do |t|
    t.string   "size"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizings", force: :cascade do |t|
    t.integer  "size_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_sizings_on_product_id", using: :btree
    t.index ["size_id"], name: "index_sizings_on_size_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "role"
  end

  add_foreign_key "orderings", "orders"
  add_foreign_key "orderings", "products"
  add_foreign_key "sizings", "products"
  add_foreign_key "sizings", "sizes"
end

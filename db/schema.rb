# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_13_044353) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.bigint "retailer_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_items_on_product_id"
    t.index ["retailer_id"], name: "index_items_on_retailer_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "kind"
    t.string "name"
    t.integer "unit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "receipt_lines", force: :cascade do |t|
    t.integer "quantity"
    t.integer "unit_price_cent"
    t.integer "taxe_rate"
    t.integer "amount_taxe_cent"
    t.integer "amount_excluding_taxes_cent"
    t.integer "amount_including_taxes_cent"
    t.bigint "item_id", null: false
    t.bigint "receipt_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_receipt_lines_on_item_id"
    t.index ["receipt_id"], name: "index_receipt_lines_on_receipt_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.integer "amount_excluding_taxes_cent"
    t.integer "amount_including_taxes_cent"
    t.integer "taxe_rate"
    t.integer "amount_taxes_cent"
    t.bigint "retailer_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["retailer_id"], name: "index_receipts_on_retailer_id"
    t.index ["user_id"], name: "index_receipts_on_user_id"
  end

  create_table "retailers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "street"
    t.string "number"
    t.string "complement"
    t.string "country"
    t.string "region"
    t.index ["email"], name: "index_retailers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_retailers_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "firest_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "items", "products"
  add_foreign_key "items", "retailers"
  add_foreign_key "receipt_lines", "items"
  add_foreign_key "receipt_lines", "receipts"
  add_foreign_key "receipts", "retailers"
  add_foreign_key "receipts", "users"
end

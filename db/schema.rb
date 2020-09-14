# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_14_135617) do

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "desciption"
    t.integer "price"
    t.boolean "approved", default: false
    t.integer "seller_id"
    t.integer "product_categories_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_categories_id"], name: "index_products_on_product_categories_id"
    t.index ["seller_id"], name: "index_products_on_seller_id"
  end

  add_foreign_key "products", "product_categories", column: "product_categories_id"
  add_foreign_key "products", "sellers"
end

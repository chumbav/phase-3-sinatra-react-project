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

ActiveRecord::Schema.define(version: 2023_06_08_134301) do

  create_table "categories", force: :cascade do |t|
    t.integer "product_id"
    t.string "name", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "description"
    t.string "image"
    t.integer "price"
    t.integer "rating"
    t.integer "category_id"
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "review"
    t.integer "product_id"
    t.index ["product_id"], name: "index_reviews_on_product_id"
  end

  add_foreign_key "products", "categories"
  add_foreign_key "reviews", "products"
end

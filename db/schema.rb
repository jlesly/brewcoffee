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

ActiveRecord::Schema.define(version: 2021_05_10_142339) do

  create_table "brews", force: :cascade do |t|
    t.string "name"
    t.string "brand"
    t.integer "grind_size"
    t.decimal "dose"
    t.decimal "extraction_volume"
    t.decimal "extraction_time"
    t.integer "equipment_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["equipment_id"], name: "index_brews_on_equipment_id"
    t.index ["user_id"], name: "index_brews_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "brew_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brew_id"], name: "index_comments_on_brew_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string "brand_model"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "brews", "equipment"
  add_foreign_key "brews", "users"
  add_foreign_key "comments", "brews"
  add_foreign_key "comments", "users"
end

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

ActiveRecord::Schema.define(version: 2021_03_31_233231) do

  create_table "beaches", force: :cascade do |t|
    t.text "name"
    t.text "street"
    t.text "city"
    t.text "parking"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "breaks", force: :cascade do |t|
    t.text "location"
    t.text "name"
    t.text "break_type"
    t.text "direction"
    t.text "height"
    t.text "water_level"
    t.text "suggested_skill_level"
    t.integer "shakas"
    t.integer "user_id"
    t.integer "beach_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.text "private_account", default: "Yes"
    t.text "phone_number", default: "N/A"
    t.text "location", default: "N/A"
    t.text "skill_level", default: "Almost Kook"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.text "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end

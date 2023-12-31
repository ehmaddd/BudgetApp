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

ActiveRecord::Schema[7.0].define(version: 2023_08_18_132843) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deal_groups", force: :cascade do |t|
    t.bigint "deal_id", null: false
    t.bigint "group_id", null: false
    t.index ["deal_id"], name: "index_deal_groups_on_deal_id"
    t.index ["group_id"], name: "index_deal_groups_on_group_id"
  end

  create_table "deals", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.string "name"
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "created_at"
    t.index ["author_id"], name: "index_deals_on_author_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.string "icon"
    t.datetime "created_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", default: "2023-08-18 13:46:33", null: false
    t.datetime "updated_at", default: "2023-08-18 13:46:33", null: false
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
  end

  add_foreign_key "deal_groups", "deals"
  add_foreign_key "deal_groups", "groups"
  add_foreign_key "deals", "users", column: "author_id"
  add_foreign_key "groups", "users"
end

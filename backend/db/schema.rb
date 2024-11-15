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

ActiveRecord::Schema[7.2].define(version: 2024_11_12_202135) do
  create_table "customer_purchases", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "purchase_amount_cents", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_purchases_on_customer_id"
  end

  create_table "rewards", force: :cascade do |t|
    t.string "query_rule", null: false
    t.string "name", null: false
    t.index ["name"], name: "index_rewards_on_name"
  end
end

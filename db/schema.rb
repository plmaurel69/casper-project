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

ActiveRecord::Schema.define(version: 2022_02_01_194859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "balance_sheets", force: :cascade do |t|
    t.float "balance"
    t.bigint "property_contract_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["property_contract_id"], name: "index_balance_sheets_on_property_contract_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.float "amount"
    t.string "type"
    t.boolean "paid"
    t.date "payment_date"
    t.bigint "balance_sheet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["balance_sheet_id"], name: "index_expenses_on_balance_sheet_id"
  end

  create_table "incomes", force: :cascade do |t|
    t.float "amount"
    t.string "type"
    t.boolean "paid"
    t.date "payment_date"
    t.bigint "balance_sheet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["balance_sheet_id"], name: "index_incomes_on_balance_sheet_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "property_contract_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["property_contract_id"], name: "index_messages_on_property_contract_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "address"
    t.string "rental_status"
    t.integer "size"
    t.string "property_name"
    t.string "property_type"
    t.integer "property_amount"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "property_contracts", force: :cascade do |t|
    t.date "end_date"
    t.date "start_date"
    t.date "scheduled_payment_date"
    t.string "billing_frequency"
    t.integer "rent_price"
    t.string "rent_payment_status"
    t.bigint "property_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["property_id"], name: "index_property_contracts_on_property_id"
    t.index ["user_id"], name: "index_property_contracts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "profession"
    t.string "professional_status"
    t.date "birth_date"
    t.string "user_type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "balance_sheets", "property_contracts"
  add_foreign_key "expenses", "balance_sheets"
  add_foreign_key "incomes", "balance_sheets"
  add_foreign_key "messages", "property_contracts"
  add_foreign_key "messages", "users"
  add_foreign_key "properties", "users"
  add_foreign_key "property_contracts", "properties"
  add_foreign_key "property_contracts", "users"
end

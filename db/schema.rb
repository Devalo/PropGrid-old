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

ActiveRecord::Schema.define(version: 2020_03_13_201446) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foobars", force: :cascade do |t|
    t.string "name"
    t.integer "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "property_number"
    t.integer "postal_code"
    t.string "city"
    t.string "property_image"
    t.integer "rent"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "property_units", force: :cascade do |t|
    t.integer "unit_number"
    t.string "tenant"
    t.text "description"
    t.bigint "property_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "tenant_id"
    t.integer "property_type"
    t.boolean "kitchen"
    t.boolean "bathroom"
    t.integer "number_of_rooms"
    t.integer "storage_spaces"
    t.integer "parking_lots"
    t.decimal "rent", precision: 8, scale: 2
    t.index ["property_id"], name: "index_property_units_on_property_id"
    t.index ["tenant_id"], name: "index_property_units_on_tenant_id"
    t.index ["user_id"], name: "index_property_units_on_user_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.date "birth_date"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["confirmation_token"], name: "index_tenants_on_confirmation_token", unique: true
    t.index ["email"], name: "index_tenants_on_email", unique: true
    t.index ["reset_password_token"], name: "index_tenants_on_reset_password_token", unique: true
    t.index ["user_id"], name: "index_tenants_on_user_id"
  end

  create_table "todo_items", force: :cascade do |t|
    t.string "title"
    t.bigint "property_unit_id", null: false
    t.boolean "complete", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["property_unit_id"], name: "index_todo_items_on_property_unit_id"
    t.index ["user_id"], name: "index_todo_items_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin_role", default: false
    t.boolean "landlord_role", default: true
    t.boolean "tenant_role", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "properties", "users"
  add_foreign_key "property_units", "properties"
  add_foreign_key "property_units", "tenants"
  add_foreign_key "property_units", "users"
  add_foreign_key "tenants", "users"
  add_foreign_key "todo_items", "property_units"
  add_foreign_key "todo_items", "users"
end

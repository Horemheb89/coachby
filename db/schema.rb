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

ActiveRecord::Schema.define(version: 2020_06_27_105931) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contracts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "coach_id"
    t.bigint "athlete_id"
    t.index ["athlete_id"], name: "index_contracts_on_athlete_id"
    t.index ["coach_id"], name: "index_contracts_on_coach_id"
  end

  create_table "doses", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "meal_id", null: false
    t.bigint "ingredient_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ingredient_id"], name: "index_doses_on_ingredient_id"
    t.index ["meal_id"], name: "index_doses_on_meal_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.integer "proteins"
    t.integer "fats"
    t.integer "carbs"
    t.string "category"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "meals", force: :cascade do |t|
    t.string "type"
    t.datetime "date"
    t.bigint "program_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["program_id"], name: "index_meals_on_program_id"
  end

  create_table "programs", force: :cascade do |t|
    t.integer "proteins_target"
    t.integer "fats_target"
    t.integer "carbs_target"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "contract_id"
    t.index ["contract_id"], name: "index_programs_on_contract_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_coach"
    t.string "first_name"
    t.string "last_name"
    t.float "weight"
    t.date "dob"
    t.integer "height"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "doses", "ingredients"
  add_foreign_key "doses", "meals"
  add_foreign_key "meals", "programs"
end

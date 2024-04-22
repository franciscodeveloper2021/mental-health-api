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

ActiveRecord::Schema[7.1].define(version: 2024_04_20_221239) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evaluated_instruments", force: :cascade do |t|
    t.bigint "evaluated_id", null: false
    t.bigint "instrument_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluated_id"], name: "index_evaluated_instruments_on_evaluated_id"
    t.index ["instrument_id"], name: "index_evaluated_instruments_on_instrument_id"
  end

  create_table "evaluateds", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "cpf", null: false
    t.string "email", limit: 254, null: false
    t.date "birthdate", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "index_evaluateds_on_cpf", unique: true
    t.index ["email"], name: "index_evaluateds_on_email", unique: true
    t.check_constraint "length(name::text) >= 2", name: "min_length_name"
  end

  create_table "instruments", force: :cascade do |t|
    t.string "title", limit: 40, null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.check_constraint "length(description) >= 10", name: "description_length"
    t.check_constraint "length(title::text) >= 5", name: "title_length"
  end

  add_foreign_key "evaluated_instruments", "evaluateds"
  add_foreign_key "evaluated_instruments", "instruments"
end

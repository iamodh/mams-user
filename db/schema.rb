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

ActiveRecord::Schema[8.1].define(version: 2025_12_31_035633) do
  create_table "courses", force: :cascade do |t|
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.integer "marathon_id", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["marathon_id", "name"], name: "index_courses_on_marathon_id_and_name", unique: true
    t.index ["marathon_id"], name: "index_courses_on_marathon_id"
  end

  create_table "marathons", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "entry_end"
    t.datetime "entry_start"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.string "address"
    t.integer "course_id", null: false
    t.datetime "created_at", null: false
    t.date "date_of_birth"
    t.string "name"
    t.string "phone"
    t.integer "status"
    t.datetime "updated_at", null: false
    t.index ["course_id", "phone"], name: "index_registrations_on_course_id_and_phone", unique: true
    t.index ["course_id"], name: "index_registrations_on_course_id"
  end

  add_foreign_key "courses", "marathons"
  add_foreign_key "registrations", "courses"
end

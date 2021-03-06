# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180513183213) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.datetime "date"
    t.integer "staff_id"
    t.integer "patient_id"
    t.datetime "timeSpent"
    t.integer "price"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
    t.index ["staff_id"], name: "index_appointments_on_staff_id"
  end

  create_table "images", force: :cascade do |t|
    t.integer "articleId"
    t.string "fileName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade do |t|
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
  end

  create_table "pages", force: :cascade do |t|
    t.integer "articleId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "phoneNumber"
    t.text "allergies"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.integer "status"
    t.string "dentalNumber"
    t.boolean "isActive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phoneNumber"
    t.integer "user_id"
    t.index ["user_id"], name: "index_staffs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.integer "status", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end

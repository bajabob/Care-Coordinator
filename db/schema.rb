# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160411184825) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "care_providers", force: :cascade do |t|
    t.string   "office_name"
    t.string   "office_phone"
    t.string   "office_phone_ext"
    t.string   "office_email"
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "physician_name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "poster_email"
    t.string   "poster_name"
    t.string   "comment"
    t.integer  "itinerary_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "email_links", force: :cascade do |t|
    t.string   "auth_token"
    t.string   "to_email"
    t.string   "to_name"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "itinerary_id"
  end

  create_table "itineraries", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.string   "description"
    t.integer  "itinerary_status_id"
    t.integer  "user_id"
    t.integer  "care_provider_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "itinerary_statuses", force: :cascade do |t|
    t.string   "const"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tests", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name_first"
    t.string   "name_last"
    t.string   "email"
    t.string   "password"
    t.string   "sms_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "itineraries"
  add_foreign_key "email_links", "users"
  add_foreign_key "itineraries", "care_providers"
  add_foreign_key "itineraries", "itinerary_statuses"
  add_foreign_key "itineraries", "users"
end

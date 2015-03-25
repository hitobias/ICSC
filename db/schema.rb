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

ActiveRecord::Schema.define(version: 20150325134451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conference_options", force: :cascade do |t|
    t.string   "option_name"
    t.integer  "donate_amount"
    t.string   "short_code"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "conference_id"
  end

  add_index "conference_options", ["conference_id"], name: "index_conference_options_on_conference_id", using: :btree

  create_table "conferences", force: :cascade do |t|
    t.string   "name"
    t.date     "deadline"
    t.text     "announcement"
    t.boolean  "enabled"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "no_of_applicants"
    t.integer  "donate_amount"
    t.boolean  "edible",           default: true
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "groups", ["user_id"], name: "index_groups_on_user_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.integer  "no"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "chinese_name"
    t.string   "gender"
    t.string   "relationship"
    t.string   "country"
    t.string   "church"
    t.boolean  "pick_up"
    t.date     "arrived_date"
    t.time     "arrived_time"
    t.string   "arrived_airport"
    t.string   "arrived_flight_no"
    t.boolean  "drop_off"
    t.date     "departed_date"
    t.time     "departed_time"
    t.string   "departed_airport"
    t.string   "departed_flight_no"
    t.boolean  "hospitality"
    t.string   "conference_option"
    t.text     "comments"
    t.boolean  "enabled",            default: true
    t.boolean  "donated",            default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "email"
    t.integer  "group_id"
    t.integer  "age"
  end

  add_index "members", ["group_id"], name: "index_members_on_group_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "gender"
    t.string   "country"
    t.string   "church"
    t.string   "email"
    t.string   "mobile"
    t.string   "phone"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.string   "role"
    t.text     "comments"
    t.datetime "activated_at"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "conference_options", "conferences"
  add_foreign_key "groups", "users"
  add_foreign_key "members", "groups"
end

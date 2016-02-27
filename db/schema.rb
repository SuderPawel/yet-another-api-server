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

ActiveRecord::Schema.define(version: 20160227112433) do

  create_table "apis", force: :cascade do |t|
    t.string   "name"
    t.string   "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "apis", ["uuid"], name: "index_apis_on_uuid", unique: true

  create_table "events", force: :cascade do |t|
    t.integer  "api_id"
    t.string   "method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "body"
  end

  add_index "events", ["api_id"], name: "index_events_on_api_id"

  create_table "properties", force: :cascade do |t|
    t.string   "name"
    t.string   "source"
    t.string   "value"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "properties", ["event_id"], name: "index_properties_on_event_id"

end

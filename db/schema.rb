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

ActiveRecord::Schema.define(version: 20150609040956) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guest_rsvps", force: true do |t|
    t.integer "rsvp_id",  null: false
    t.integer "guest_id", null: false
    t.boolean "status"
  end

  create_table "guests", force: true do |t|
    t.string   "name"
    t.integer  "party_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order"
  end

  create_table "parties", force: true do |t|
    t.integer  "max_guests"
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rsvps", force: true do |t|
    t.integer "party_id",         null: false
    t.text    "message"
    t.string  "url"
    t.string  "address_line_one"
    t.string  "address_line_two"
    t.string  "city"
    t.string  "state"
    t.string  "country"
    t.string  "postal_code"
  end

end

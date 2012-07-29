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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120729140730) do

  create_table "propositions", :force => true do |t|
    t.text     "title"
    t.text     "overview"
    t.text     "full"
    t.text     "slug"
    t.text     "state"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "signatures", :force => true do |t|
    t.integer  "user_id"
    t.integer  "proposition_id"
    t.text     "data"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "opentok_archive_id"
  end

  create_table "users", :force => true do |t|
    t.string   "phone"
    t.string   "street_address"
    t.string   "email_address"
    t.string   "city"
    t.string   "state"
    t.string   "name"
    t.string   "zip_code"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.boolean  "tos_acceptance"
  end

end

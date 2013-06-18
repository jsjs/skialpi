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

ActiveRecord::Schema.define(:version => 20130616160616) do

  create_table "achievements", :force => true do |t|
    t.date     "date"
    t.text     "note"
    t.string   "time"
    t.integer  "track_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "points"
  end

  add_index "achievements", ["date"], :name => "index_achievements_on_date"
  add_index "achievements", ["points"], :name => "index_achievements_on_points"

  create_table "areas", :force => true do |t|
    t.string   "name"
    t.integer  "location_id"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "areas", ["name"], :name => "index_areas_on_name"

  create_table "bug_reports", :force => true do |t|
    t.integer  "user_id"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "description"
    t.text     "conditions"
    t.text     "access"
  end

  add_index "locations", ["name"], :name => "index_locations_on_name"

  create_table "tracks", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "slope"
    t.string   "difficulty"
    t.integer  "altitude"
    t.text     "note"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "exposure"
    t.integer  "area_id"
  end

  add_index "tracks", ["id"], :name => "index_tracks_on_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "sex"
    t.boolean  "show_email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "remember_token"
    t.string   "password_digest"
    t.text     "about"
    t.string   "name"
    t.date     "birthdate"
    t.boolean  "show_age"
    t.boolean  "admin",           :default => false
    t.boolean  "helpers",         :default => true
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  add_foreign_key "achievements", "tracks", :name => "achievements_track_id_fk"
  add_foreign_key "achievements", "users", :name => "achievements_user_id_fk"

  add_foreign_key "areas", "locations", :name => "areas_location_id_fk"

  add_foreign_key "bug_reports", "users", :name => "bug_reports_user_id_fk"

  add_foreign_key "tracks", "areas", :name => "tracks_area_id_fk"

end

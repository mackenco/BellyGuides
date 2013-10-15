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

ActiveRecord::Schema.define(:version => 20131015153807) do

  create_table "comments", :force => true do |t|
    t.integer  "owner_id"
    t.integer  "map_id"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["map_id"], :name => "index_comments_on_map_id"
  add_index "comments", ["owner_id"], :name => "index_comments_on_owner_id"

  create_table "favorites", :force => true do |t|
    t.integer  "user_id"
    t.integer  "map_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "favorites", ["map_id"], :name => "index_favorites_on_map_id"
  add_index "favorites", ["user_id", "map_id"], :name => "index_favorites_on_user_id_and_map_id"
  add_index "favorites", ["user_id"], :name => "index_favorites_on_user_id"

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "maps", :force => true do |t|
    t.integer  "owner_id",    :null => false
    t.string   "title",       :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "description"
    t.string   "slug"
  end

  add_index "maps", ["owner_id"], :name => "index_maps_on_owner_id"
  add_index "maps", ["slug"], :name => "index_maps_on_slug", :unique => true

  create_table "restaurants", :force => true do |t|
    t.string   "name"
    t.boolean  "completed"
    t.text     "note"
    t.string   "source_url"
    t.integer  "map_id"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "address"
  end

  add_index "restaurants", ["map_id"], :name => "index_restaurants_on_map_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "session_token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "email"
    t.string   "slug"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["session_token"], :name => "index_users_on_session_token"
  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username"

end

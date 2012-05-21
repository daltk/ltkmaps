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

ActiveRecord::Schema.define(:version => 20120521154523) do

  create_table "articles", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "content_type"
    t.string   "disabled_text"
    t.boolean  "published"
    t.string   "category"
    t.boolean  "secret"
    t.boolean  "draft"
  end

  create_table "comments", :force => true do |t|
    t.string   "name",       :null => false
    t.text     "body",       :null => false
    t.integer  "article_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["article_id"], :name => "index_comments_on_article_id"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.integer  "street_number"
    t.string   "street_name"
    t.string   "street_direction"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.integer  "location_radious"
    t.string   "created_by"
    t.string   "date_time"
    t.string   "blank_field_1"
    t.string   "blank_field_2"
    t.string   "blank_field_3"
    t.string   "blank_field_4"
    t.string   "blank_field_5"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "user_id"
  end

  create_table "locations", :force => true do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.integer  "event_id"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "role"
    t.string   "category"
    t.string   "game"
    t.string   "skill_level"
    t.string   "specialization"
    t.integer  "street_number"
    t.string   "street_name"
    t.string   "street_direction"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode_1"
    t.string   "zipcode_2"
    t.string   "phone"
    t.string   "email"
    t.integer  "fu_street_number"
    t.string   "fu_street_name"
    t.string   "fu_street_direction"
    t.string   "fu_city"
    t.string   "fu_state"
    t.string   "fu_zipcode_1"
    t.string   "blank_field_1"
    t.string   "blank_field_2"
    t.string   "blank_field_3"
    t.string   "blank_field_4"
    t.string   "blank_field_5"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "password"
    t.datetime "fu_from"
    t.datetime "fu_to"
  end

end

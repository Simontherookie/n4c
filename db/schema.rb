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

ActiveRecord::Schema.define(:version => 20121126053950) do

  create_table "gifts", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "description"
    t.string   "category"
    t.integer  "guest_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "gifts", ["category"], :name => "index_gifts_on_category"
  add_index "gifts", ["guest_id"], :name => "index_gifts_on_guest_id"

  create_table "guests", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.boolean  "going_to_reception", :default => false
    t.boolean  "rsvp_wedding"
    t.boolean  "rsvp_reception"
    t.boolean  "rsvp_bbq"
  end

end

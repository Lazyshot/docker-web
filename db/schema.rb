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

ActiveRecord::Schema.define(:version => 20130614142643) do

  create_table "apps", :force => true do |t|
    t.string   "name"
    t.string   "github_url"
    t.string   "github_key"
    t.integer  "user_id"
    t.integer  "image_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "apps", ["image_id"], :name => "index_apps_on_image_id"
  add_index "apps", ["user_id"], :name => "index_apps_on_user_id"

  create_table "containers", :force => true do |t|
    t.integer  "app_id"
    t.integer  "host_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "containers", ["app_id"], :name => "index_containers_on_app_id"
  add_index "containers", ["host_id"], :name => "index_containers_on_host_id"

  create_table "hosts", :force => true do |t|
    t.string   "ip"
    t.integer  "port"
    t.integer  "memory"
    t.integer  "vcpus"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "images", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "is_public"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "images", ["user_id"], :name => "index_images_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "failed_login_count"
    t.integer  "login_count"
    t.datetime "last_request_at"
    t.datetime "curent_login_at"
    t.datetime "last_login_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

end

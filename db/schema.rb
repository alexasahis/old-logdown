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

ActiveRecord::Schema.define(:version => 20111211150141) do

  create_table "attached_images", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "processing"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attached_images", ["image_content_type"], :name => "index_attached_images_on_image_content_type"
  add_index "attached_images", ["user_id"], :name => "index_attached_images_on_user_id"

  create_table "authorizations", :force => true do |t|
    t.string   "provider"
    t.integer  "user_id"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blogs", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "subtitle"
    t.text     "description"
    t.string   "excerpt_link_name",         :default => "READ MORE"
    t.integer  "recent_post_limit",         :default => 5
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "custom_asides",             :default => false
    t.string   "disqus_short_name"
    t.boolean  "disqus_show_comment_count", :default => true
    t.boolean  "titlecase",                 :default => true
    t.boolean  "has_custom_sidebar",        :default => false
    t.integer  "recent_posts_limit",        :default => 5
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.text     "excerpt"
    t.integer  "blog_id"
    t.integer  "user_id"
    t.boolean  "no_header",      :default => false
    t.boolean  "meta",           :default => true
    t.boolean  "enable_comment", :default => true
    t.boolean  "enable_sharing", :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "aasm_state"
    t.datetime "published_at"
    t.boolean  "has_sidebar",    :default => true
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_roles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "login"
    t.string   "screen_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

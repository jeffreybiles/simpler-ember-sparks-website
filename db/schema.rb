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

ActiveRecord::Schema.define(version: 20170326213358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.string   "stripe_customer_id"
    t.boolean  "subscribed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.string   "video_url"
    t.text     "description"
    t.text     "transcript"
    t.date     "publish_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "links"
    t.string   "thumbnail_image"
    t.string   "permalink"
    t.boolean  "free",            default: false
    t.string   "difficulty"
    t.integer  "seconds"
    t.text     "wistia_embed"
    t.text     "code"
    t.string   "guid"
    t.string   "embed_id"
    t.string   "youtube_url"
  end

  add_index "posts", ["permalink"], name: "index_posts_on_permalink", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.datetime "created_at"
    t.integer  "post_id"
  end

  create_table "tags", force: true do |t|
    t.string  "name"
    t.text    "description"
    t.string  "tag_type"
    t.decimal "priority"
    t.string  "permalink"
    t.date    "most_recent_publish_date"
    t.integer "taggings_count"
    t.string  "thumbnail_image"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree
  add_index "tags", ["permalink"], name: "index_tags_on_permalink", using: :btree

  create_table "testimonials", force: true do |t|
    t.string   "link"
    t.string   "testifier"
    t.string   "credentials"
    t.string   "quote"
    t.integer  "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                                                 default: "",    null: false
    t.string   "encrypted_password",                                    default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                         default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "subscribed"
    t.string   "stripe_customer_id"
    t.boolean  "admin",                                                 default: false
    t.integer  "organization_id"
    t.string   "organization_permission_level"
    t.string   "invitation_token"
    t.string   "invitation_status"
    t.decimal  "default_playback_speed",        precision: 4, scale: 2, default: 1.0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

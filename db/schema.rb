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

ActiveRecord::Schema.define(version: 20161105194237) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "event_details", force: :cascade do |t|
    t.string   "venue_name"
    t.string   "venue_street_addr1"
    t.string   "venue_street_addr2"
    t.string   "venue_city"
    t.text     "event_info"
    t.string   "event_photo"
    t.integer  "event_theme"
    t.text     "event_accom"
    t.text     "event_transport"
    t.integer  "event_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "venue_state"
    t.string   "venue_zip"
    t.index ["event_id"], name: "index_event_details_on_event_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "event_type"
    t.date     "event_date"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "event_name"
    t.date     "event_rsvp_date"
    t.string   "path"
    t.string   "slug"
    t.string   "stripe_customer_token"
    t.integer  "event_detail_id"
    t.index ["event_detail_id"], name: "index_events_on_event_detail_id", using: :btree
    t.index ["path"], name: "index_events_on_path", unique: true, using: :btree
    t.index ["slug"], name: "index_events_on_slug", using: :btree
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "guests", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "phone"
    t.boolean  "guest_status"
    t.integer  "party_id"
    t.index "lower((email)::text)", name: "guests_lower_email", using: :btree
    t.index "lower((first_name)::text) varchar_pattern_ops", name: "guests_lower_first_name", using: :btree
    t.index "lower((last_name)::text) varchar_pattern_ops", name: "guests_lower_last_name", using: :btree
    t.index ["email"], name: "index_guests_on_email", using: :btree
    t.index ["event_id"], name: "index_guests_on_event_id", using: :btree
    t.index ["first_name"], name: "index_guests_on_first_name", using: :btree
    t.index ["last_name"], name: "index_guests_on_last_name", using: :btree
    t.index ["party_id"], name: "index_guests_on_party_id", using: :btree
  end

  create_table "parties", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "party_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_parties_on_event_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "first_name"
    t.string   "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "event_details", "events"
  add_foreign_key "events", "event_details"
  add_foreign_key "guests", "parties"
end

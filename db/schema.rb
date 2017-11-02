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

ActiveRecord::Schema.define(version: 20171101215204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.integer  "resource_id", null: false
    t.integer  "fan_id",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["fan_id"], name: "index_favorites_on_fan_id", using: :btree
  end

  create_table "resource_tags", force: :cascade do |t|
    t.integer  "resource_id", null: false
    t.integer  "tag_id",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "resources", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "url",        null: false
    t.integer  "author_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_resources_on_author_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.boolean  "permission", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "email",           null: false
    t.string   "password_digest"
    t.string   "user_type",       null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end

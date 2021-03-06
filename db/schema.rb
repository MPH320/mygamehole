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

ActiveRecord::Schema.define(version: 20170616143732) do

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "value"
  end

  add_index "events", ["game_id"], name: "index_events_on_game_id"
  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "games", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.string   "javascript"
    t.string   "style"
    t.string   "content"
  end

  add_index "games", ["user_id"], name: "index_games_on_user_id"

  create_table "reviews", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "rating"
    t.integer  "game_id"
    t.string   "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reviews", ["game_id"], name: "index_reviews_on_game_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "email_confirmed", default: false
    t.string   "confirm_token"
  end

end

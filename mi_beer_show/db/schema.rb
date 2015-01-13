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

ActiveRecord::Schema.define(version: 20150105232732) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beers", force: true do |t|
    t.string   "name"
    t.string   "brewery"
    t.string   "location"
    t.string   "style"
    t.float    "average_score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "podcasts", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "subtitle"
    t.string   "resource_url"
    t.integer  "length"
    t.date     "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "podcasts_beers", force: true do |t|
    t.integer  "podcast_id"
    t.integer  "beer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "podcasts_beers", ["beer_id"], name: "index_podcasts_beers_on_beer_id", using: :btree
  add_index "podcasts_beers", ["podcast_id"], name: "index_podcasts_beers_on_podcast_id", using: :btree

  create_table "scores", force: true do |t|
    t.integer  "rating"
    t.string   "judge"
    t.string   "description"
    t.integer  "podcast_id"
    t.integer  "beer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_hash"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

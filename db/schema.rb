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

ActiveRecord::Schema.define(version: 20170212203737) do

  create_table "people", force: :cascade do |t|
    t.string   "f_name",     null: false
    t.string   "l_name"
    t.string   "nick_name"
    t.string   "team"
    t.string   "title"
    t.string   "location"
    t.string   "email"
    t.string   "slack"
    t.string   "mobile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "person_comments", force: :cascade do |t|
    t.integer  "person_id",                        null: false
    t.string   "commenter",  default: "Anonymous", null: false
    t.string   "comment",                          null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["person_id"], name: "index_person_comments_on_person_id"
  end

  create_table "rank_comments", force: :cascade do |t|
    t.integer  "rank_id",                          null: false
    t.string   "commenter",  default: "Anonymous", null: false
    t.string   "comment",                          null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["rank_id"], name: "index_rank_comments_on_rank_id"
  end

  create_table "ranks", force: :cascade do |t|
    t.integer  "person_id",               null: false
    t.integer  "skill_id",                null: false
    t.integer  "thumb_ups",   default: 0, null: false
    t.integer  "thumb_downs", default: 0, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["person_id", "skill_id"], name: "index_ranks_on_person_id_and_skill_id", unique: true
    t.index ["person_id"], name: "index_ranks_on_person_id"
    t.index ["skill_id"], name: "index_ranks_on_skill_id"
  end

  create_table "skill_comments", force: :cascade do |t|
    t.integer  "skill_id",                         null: false
    t.string   "commenter",  default: "Anonymous", null: false
    t.string   "comment",                          null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["skill_id"], name: "index_skill_comments_on_skill_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string   "title",       null: false
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end

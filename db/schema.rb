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

ActiveRecord::Schema.define(version: 20160530082856) do

# Could not dump table "achievements" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "achievements_pictures", id: false, force: :cascade do |t|
    t.integer "achievement_id", null: false
    t.integer "picture_id",     null: false
  end

  create_table "achievements_users", id: false, force: :cascade do |t|
    t.integer "user_id",        null: false
    t.integer "achievement_id", null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "url"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures_projects", id: false, force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "picture_id", null: false
  end

# Could not dump table "projects" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "projects_reviews", id: false, force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "review_id",  null: false
  end

  create_table "projects_users", id: false, force: :cascade do |t|
    t.integer "user_id",    null: false
    t.integer "project_id", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id"
    t.integer  "user_id"
  end

  create_table "reviews_users", id: false, force: :cascade do |t|
    t.integer "user_id",   null: false
    t.integer "review_id", null: false
  end

# Could not dump table "users" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

end

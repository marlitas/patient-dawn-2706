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

ActiveRecord::Schema.define(version: 2021_08_04_151945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.bigint "mechanic_id", null: false
    t.bigint "ride_id", null: false
    t.index ["mechanic_id"], name: "index_assignments_on_mechanic_id"
    t.index ["ride_id"], name: "index_assignments_on_ride_id"
  end

  create_table "competitions", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "sport"
  end

  create_table "entries", force: :cascade do |t|
    t.bigint "competition_id"
    t.bigint "team_id"
    t.index ["competition_id"], name: "index_entries_on_competition_id"
    t.index ["team_id"], name: "index_entries_on_team_id"
  end

  create_table "mechanics", force: :cascade do |t|
    t.string "name"
    t.integer "years_of_experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "rides", force: :cascade do |t|
    t.string "name"
    t.integer "thrill_rating"
    t.boolean "open"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "hometown"
    t.string "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "assignments", "mechanics"
  add_foreign_key "assignments", "rides"
  add_foreign_key "entries", "competitions"
  add_foreign_key "entries", "teams"
  add_foreign_key "players", "teams"
end

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

ActiveRecord::Schema.define(version: 20170222015019) do

  create_table "game_states", force: :cascade do |t|
    t.string   "grillWorms"
    t.string   "deadGrillWorms"
    t.string   "activeDice"
    t.string   "frozenDice"
    t.string   "frozenDiceTotal"
    t.string   "gameStatus"
    t.string   "playerMessage"
    t.string   "playerWorms"
    t.string   "playerWormsTotals"
    t.integer  "gameID"
    t.datetime "created_at",        null: false
    t.integer  "game_id"
    t.datetime "updated_at",        null: false
  end

  add_index "game_states", ["game_id"], name: "index_game_states_on_game_id"

  create_table "games", force: :cascade do |t|
    t.integer  "player_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "games", ["player_id"], name: "index_games_on_player_id"

  create_table "grill_worm_tiles", force: :cascade do |t|
    t.integer  "grill_id"
    t.integer  "worm_id"
    t.integer  "can_take"
    t.integer  "is_dead"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "grill_worm_tiles", ["grill_id"], name: "index_grill_worm_tiles_on_grill_id"
  add_index "grill_worm_tiles", ["worm_id"], name: "index_grill_worm_tiles_on_worm_id"

  create_table "grills", force: :cascade do |t|
    t.integer  "game_state_id"
    t.integer  "grill_worm_tiles_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "grills", ["game_state_id"], name: "index_grills_on_game_state_id"
  add_index "grills", ["grill_worm_tiles_id"], name: "index_grills_on_grill_worm_tiles_id"

  create_table "images", force: :cascade do |t|
    t.string   "target"
    t.string   "filename"
    t.string   "filetype"
    t.string   "description"
    t.integer  "theme_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "images", ["theme_id"], name: "index_images_on_theme_id"

  create_table "players", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "players", ["user_id"], name: "index_players_on_user_id"

  create_table "themes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "worm_tiles", force: :cascade do |t|
    t.integer  "value"
    t.integer  "worm_count"
    t.integer  "image_id"
    t.integer  "theme_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "worm_tiles", ["image_id"], name: "index_worm_tiles_on_image_id"
  add_index "worm_tiles", ["theme_id"], name: "index_worm_tiles_on_theme_id"

end

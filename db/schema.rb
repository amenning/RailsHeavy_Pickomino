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

ActiveRecord::Schema.define(version: 20170718025734) do

  create_table "active_dice_sets", force: :cascade do |t|
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "active_dice_sets", ["game_id"], name: "index_active_dice_sets_on_game_id"

  create_table "active_dices", force: :cascade do |t|
    t.integer  "active_dice_set_id"
    t.integer  "can_freeze"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "active_dices", ["active_dice_set_id"], name: "index_active_dices_on_active_dice_set_id"

  create_table "dices", force: :cascade do |t|
    t.integer  "value"
    t.integer  "active_dice_id"
    t.integer  "frozen_dice_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "dices", ["active_dice_id"], name: "index_dices_on_active_dice_id"
  add_index "dices", ["frozen_dice_id"], name: "index_dices_on_frozen_dice_id"

  create_table "frozen_dice_sets", force: :cascade do |t|
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "frozen_dice_sets", ["game_id"], name: "index_frozen_dice_sets_on_game_id"

  create_table "frozen_dice_statuses", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "total"
    t.integer  "has_worm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "frozen_dice_statuses", ["game_id"], name: "index_frozen_dice_statuses_on_game_id"

  create_table "frozen_dices", force: :cascade do |t|
    t.integer  "frozen_dice_set_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "frozen_dices", ["frozen_dice_set_id"], name: "index_frozen_dices_on_frozen_dice_set_id"

  create_table "games", force: :cascade do |t|
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "games", ["player_id"], name: "index_games_on_player_id"

  create_table "gamestates", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "phase_id"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "gamestates", ["game_id"], name: "index_gamestates_on_game_id"
  add_index "gamestates", ["phase_id"], name: "index_gamestates_on_phase_id"
  add_index "gamestates", ["player_id"], name: "index_gamestates_on_player_id"

  create_table "grill_worms", force: :cascade do |t|
    t.integer  "grill_id"
    t.integer  "can_take"
    t.integer  "is_dead"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "grill_worms", ["grill_id"], name: "index_grill_worms_on_grill_id"

  create_table "grills", force: :cascade do |t|
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "grills", ["game_id"], name: "index_grills_on_game_id"

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

  create_table "phases", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_options", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "can_roll"
    t.integer  "bunk"
    t.integer  "is_game_over"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "player_options", ["game_id"], name: "index_player_options_on_game_id"

  create_table "player_statuses", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "player_statuses", ["game_id"], name: "index_player_statuses_on_game_id"
  add_index "player_statuses", ["player_id"], name: "index_player_statuses_on_player_id"

  create_table "player_worm_sets", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "player_worm_sets", ["game_id"], name: "index_player_worm_sets_on_game_id"
  add_index "player_worm_sets", ["player_id"], name: "index_player_worm_sets_on_player_id"

  create_table "player_worms", force: :cascade do |t|
    t.integer  "player_worm_set_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "player_worms", ["player_worm_set_id"], name: "index_player_worms_on_player_worm_set_id"

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
    t.string   "firstname"
    t.string   "lastname"
    t.string   "username"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.string   "provider"
    t.string   "uid"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "worms", force: :cascade do |t|
    t.integer  "value"
    t.integer  "worm_count"
    t.integer  "grill_worm_id"
    t.integer  "player_worm_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "worms", ["grill_worm_id"], name: "index_worms_on_grill_worm_id"
  add_index "worms", ["player_worm_id"], name: "index_worms_on_player_worm_id"

end

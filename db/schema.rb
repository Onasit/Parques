# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_01_11_153239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deaths", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "victim_id", null: false
    t.boolean "first_blood", default: false
    t.integer "assassin_id", null: false
    t.integer "game_id", null: false
    t.boolean "soplo", default: false
    t.integer "zone"
    t.boolean "assassin_pig", default: false
    t.boolean "victim_pig", default: false
  end

  create_table "games", force: :cascade do |t|
    t.bigint "player_id"
    t.datetime "date_and_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "death_cash", null: false
    t.integer "game_cash", null: false
    t.boolean "paused", default: false
    t.integer "pauser_id"
    t.integer "first_blood_cash_victim", default: 0
    t.integer "first_blood_cash_players", default: 0
    t.integer "season_id"
    t.index ["player_id"], name: "index_games_on_player_id"
  end

  create_table "player_games", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_player_games_on_game_id"
    t.index ["player_id"], name: "index_player_games_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.text "image"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "color"
    t.text "imagen_url"
    t.index ["email"], name: "index_players_on_email", unique: true
    t.index ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "prize"
    t.integer "player_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "completed", default: false
    t.string "name"
  end

  add_foreign_key "games", "players"
  add_foreign_key "player_games", "games"
  add_foreign_key "player_games", "players"
end

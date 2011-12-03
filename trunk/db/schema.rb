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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111203164918) do

  create_table "actions", :force => true do |t|
    t.string   "status"
    t.integer  "play_id"
    t.integer  "challenge_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "actions", ["challenge_id"], :name => "index_actions_on_challenge_id"
  add_index "actions", ["play_id"], :name => "index_actions_on_play_id"

  create_table "challenges", :force => true do |t|
    t.integer  "points"
    t.string   "title"
    t.text     "description"
    t.integer  "game_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "challenges", ["game_id"], :name => "index_challenges_on_game_id"

  create_table "games", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "status"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["creator_id"], :name => "index_games_on_creator_id"

  create_table "plays", :force => true do |t|
    t.datetime "statedAt"
    t.datetime "finishedAt"
    t.string   "status"
    t.integer  "game_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plays", ["game_id"], :name => "index_plays_on_game_id"
  add_index "plays", ["player_id"], :name => "index_plays_on_player_id"

  create_table "users", :force => true do |t|
    t.integer  "collectedPoints"
    t.string   "login"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

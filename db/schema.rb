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

ActiveRecord::Schema.define(:version => 20111208200634) do

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

  create_table "marks", :force => true do |t|
    t.integer  "pointSum"
    t.integer  "pointKind_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_challenges", :force => true do |t|
    t.string   "status"
    t.integer  "play_id"
    t.integer  "challenge_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "player_challenges", ["challenge_id"], :name => "index_player_challenges_on_challenge_id"
  add_index "player_challenges", ["play_id"], :name => "index_player_challenges_on_play_id"

  create_table "plays", :force => true do |t|
    t.datetime "startedAt"
    t.datetime "finishedAt"
    t.string   "status"
    t.integer  "game_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plays", ["game_id"], :name => "index_plays_on_game_id"
  add_index "plays", ["player_id"], :name => "index_plays_on_player_id"

  create_table "point_kinds", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reward_collections", :force => true do |t|
    t.datetime "collectDate"
    t.string   "status"
    t.integer  "winner_id"
    t.integer  "reward_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reward_collections", ["reward_id"], :name => "index_reward_collections_on_reward_id"
  add_index "reward_collections", ["winner_id"], :name => "index_reward_collections_on_winner_id"

  create_table "rewards", :force => true do |t|
    t.integer  "priceInPoints"
    t.integer  "userLimit"
    t.datetime "expirationDate"
    t.text     "description"
    t.integer  "sponsor_id"
    t.integer  "creator_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "imgae_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rewards", ["creator_id"], :name => "index_rewards_on_creator_id"
  add_index "rewards", ["sponsor_id"], :name => "index_rewards_on_sponsor_id"

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

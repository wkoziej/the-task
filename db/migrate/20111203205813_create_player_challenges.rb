class CreatePlayerChallenges < ActiveRecord::Migration
  def change
    create_table :player_challenges do |t|
      t.string :status
      t.references :play
      t.references :challenge

      t.timestamps
    end
    add_index :player_challenges, :play_id
    add_index :player_challenges, :challenge_id
  end
end

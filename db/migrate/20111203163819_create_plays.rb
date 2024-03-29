class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.timestamp :started_at
      t.timestamp :finished_at
      t.string :status
      t.references :game
      t.references :player

      t.timestamps
    end
    add_index :plays, :game_id
    add_index :plays, :player_id
  end
end

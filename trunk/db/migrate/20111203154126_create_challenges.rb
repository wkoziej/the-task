class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.integer :points
      t.string :title
      t.text :description
      t.references :game
      t.string :status

      t.timestamps
    end
    add_index :challenges, :game_id
  end
end

class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.integer :points
      t.references :pointKind
      t.string :title
      t.text :description
      t.references :game
      t.string :status
      t.string :type
      t.float :longitude 
      t.float :latitude

      t.timestamps
    end
    add_index :challenges, :game_id
  end
end

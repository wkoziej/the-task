class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.integer :points, :null => false
      t.references :pointKind, :null => false
      t.string :title, :null => false
      t.text :description, :null => false
      t.references :game, :null => false
      t.string :status, :null => false
      t.string :type, :null => false
      t.float :longitude 
      t.float :latitude

      t.timestamps
    end
    add_index :challenges, :game_id
    add_index :challenges, :pointKind_id
  end
end

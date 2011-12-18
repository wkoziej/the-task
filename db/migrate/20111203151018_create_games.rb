class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title, :null => false
      t.text :description, :null => false
      t.string :status, :null => false
      t.references :creator, :null => false

      t.timestamps
    end
    add_index :games, :creator_id
  end
end

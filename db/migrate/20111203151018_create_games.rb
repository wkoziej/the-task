class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.text :description
      t.string :status
      t.references :creator

      t.timestamps
    end
    add_index :games, :creator_id
  end
end

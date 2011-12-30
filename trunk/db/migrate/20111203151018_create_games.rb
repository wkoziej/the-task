class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title, :null => false
      t.text :description, :null => false
      t.string :status, :null => false
      t.references :creator, :null => false
      t.string :image_file_name
      t.string :image_content_type
      t.integer :imgae_file_size
      t.datetime :image_updated_at
      
      t.timestamps
    end
    add_index :games, :creator_id
  end
end

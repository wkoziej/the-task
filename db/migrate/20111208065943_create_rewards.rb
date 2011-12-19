class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.integer :priceInPoints
      t.references :pointKind
      t.integer :userLimit
      t.datetime :expirationDate
      t.text :description
      t.references :sponsor
      t.references :creator
      t.string :image_file_name
      t.string :image_content_type
      t.integer :imgae_file_size
      t.datetime :image_updated_at

      t.timestamps
    end

    add_index :rewards, :sponsor_id
    add_index :rewards, :creator_id
    add_index :rewards, :pointKind_id
  end
end

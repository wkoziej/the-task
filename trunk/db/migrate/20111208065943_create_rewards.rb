class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.integer :price_in_points
      t.references :point_kind
      t.integer :user_limit
      t.datetime :expiration_date
      t.text :description
      t.references :sponsor
      t.references :creator
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at

      t.timestamps
    end

    add_index :rewards, :sponsor_id
    add_index :rewards, :creator_id
    add_index :rewards, :point_kind_id
  end
end

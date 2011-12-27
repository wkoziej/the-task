class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.references :creator
      t.string :name

      t.timestamps
    end
    add_index :groups, :creator_id
  end
end

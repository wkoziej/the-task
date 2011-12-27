class CreateAccesses < ActiveRecord::Migration
  def change
    create_table :accesses do |t|
      t.references :game
      t.references :group

      t.timestamps
    end
    add_index :accesses, :game_id
    add_index :accesses, :group_id
  end
end

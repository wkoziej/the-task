class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :status
      t.references :play
      t.references :challenge

      t.timestamps
    end
    add_index :actions, :play_id
    add_index :actions, :challenge_id
  end
end

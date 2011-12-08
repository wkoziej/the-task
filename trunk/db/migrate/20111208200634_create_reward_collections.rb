class CreateRewardCollections < ActiveRecord::Migration
  def change
    create_table :reward_collections do |t|
      t.datetime :collectDate
      t.string :status
      t.references :winner
      t.references :reward

      t.timestamps
    end
    add_index :reward_collections, :winner_id
    add_index :reward_collections, :reward_id
  end
end

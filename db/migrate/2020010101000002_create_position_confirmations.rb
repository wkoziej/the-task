class CreatePositionConfirmations < ActiveRecord::Migration
  def change
    create_table :position_confirmations do |t|

      t.timestamps
    end
  end
end

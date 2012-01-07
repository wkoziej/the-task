class CreateConfirmingPositions < ActiveRecord::Migration
  def change
    create_table :confirming_positions do |t|

      t.timestamps
    end
  end
end

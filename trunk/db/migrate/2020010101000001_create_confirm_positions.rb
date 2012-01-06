class CreateConfirmPositions < ActiveRecord::Migration
  def change
    create_table :confirm_positions do |t|

      t.timestamps
    end
  end
end

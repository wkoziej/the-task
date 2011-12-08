class CreatePointKinds < ActiveRecord::Migration
  def change
    create_table :point_kinds do |t|
      t.string :name

      t.timestamps
    end
  end
end

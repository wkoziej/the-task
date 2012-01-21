class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.integer :point_sum
      t.references :point_kind
      t.references :user

      t.timestamps
    end
  end
end

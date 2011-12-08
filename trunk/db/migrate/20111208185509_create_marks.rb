class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.integer :pointSum
      t.references :pointKind
      t.references :user

      t.timestamps
    end
  end
end

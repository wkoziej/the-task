class PopulatePointKinds < ActiveRecord::Migration
  def up
    pointKind = PointKind.new
    pointKind.name = 'PUBLIC'
    pointKind.save ()

    pointKind = PointKind.new
    pointKind.name = 'SPONSORED_BY_A'
    pointKind.save ()
  end

  def down
  end
end

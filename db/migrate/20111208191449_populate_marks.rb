class PopulateMarks < ActiveRecord::Migration
  def up
    mark = Mark.new
    mark.user = User.find (1)
    mark.pointKind = PointKind.find(1)
    mark.pointSum = 110
    mark.save()

    mark = Mark.new
    mark.user = User.find (1)
    mark.pointKind = PointKind.find(2)
    mark.pointSum = 10
    mark.save()

  end

  def down
  end
end

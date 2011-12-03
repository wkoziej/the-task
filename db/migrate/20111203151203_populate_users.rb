class PopulateUsers < ActiveRecord::Migration
  def up
    user = User.new
    user.login = 'test'
    user.collectedPoints = 10
    user.role = "PLAYER"
    user.save()
  end

  def down
  end
end

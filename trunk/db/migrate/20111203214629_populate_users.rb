class PopulateUsers < ActiveRecord::Migration
  def up
    user = User.new
    user.login = 'test'
    user.collectedPoints = 10
    user.email = 'aaa@bbb.com'
    user.password = "aaabbb"
    user.role = "PLAYER"
    
    if not user.save() 
      say user.errors
    end
  end

  def down
  end
end

class PopulateChallenges < ActiveRecord::Migration
  def up
    challenge = Challenge.new
    challenge.game = Game.find(1)
    challenge.points = 5
    challenge.title = "Capture Code"
    challenge.description = "Ask barman for code"
    challenge.status = "ACTIVE"
    challenge.save()
  end

  def down
  end
end

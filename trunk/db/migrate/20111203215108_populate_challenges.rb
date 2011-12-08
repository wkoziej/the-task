class PopulateChallenges < ActiveRecord::Migration
  def up
    challenge = Challenge.new
    challenge.game = Game.find(1)
    challenge.points = 5
    challenge.title = "Capture Code in XCaffee"
    challenge.description = "Ask barman for code"
    challenge.status = "ACTIVE"
    challenge.save()

    challenge = Challenge.new
    challenge.game = Game.find(1)
    challenge.points = 10
    challenge.title = "Order beer in 17 Pub :)"
    challenge.description = "Order one beer and ask for code"
    challenge.status = "ACTIVE"
    challenge.save()

  end

  def down
  end
end

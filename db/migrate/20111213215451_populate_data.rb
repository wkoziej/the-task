class PopulateData < ActiveRecord::Migration
  def up
    challenge = CaptureCode.new
    challenge.game = Game.find(1)
    challenge.points = 5
    challenge.title = "Capture Code in XCaffee"
    challenge.pointKind = PointKind.find(1)
    challenge.description = "Ask barman for code"
    if not challenge.save()
      say "Errors during save" 
      challenge.errors.each do |attribute, errors_array|
        say attribute
        say errors_array
      end
    end
    challenge = EnterMessage.new
    challenge.game = Game.find(1)
    challenge.points = 10
    challenge.pointKind = PointKind.find(2)
    challenge.title = "Order beer in 17 Pub :)"
    challenge.description = "Order one beer and ask for code"
    challenge.save()

    
    reward = Reward.new
    reward.priceInPoints = 13
    reward.pointKind = PointKind.find(:first)
    reward.userLimit = 2
    reward.description = "The free glass of water"
    reward.sponsor = User.find(:first) 
    reward.creator = User.find(:first)
    reward.image = File.open("./public/reward1.jpg", "rb")
    
    if not reward.save
      logger.error reward.errors.full_messages
    end

    reward = Reward.new
    reward.priceInPoints = 25
    reward.pointKind = PointKind.find(:first)
    reward.expirationDate = "2011-12-08 07:59:43"
    reward.description = "Two Beer or not two beer"
    reward.sponsor = User.find(:first) 
    reward.creator = User.find(:first)
    reward.image = File.open("./public/reward2.jpg", "rb")

    if not reward.save
      logger.error  reward.errors.full_messages
    end
    
  end

  def down
  end
end

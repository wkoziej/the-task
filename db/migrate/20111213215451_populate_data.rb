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

  end

  def down
  end
end

require 'test_helper'

class PlayTest < ActiveSupport::TestCase
  test "creation of game with enterMessage and captureCode challenges" do
    @game = games(:one)
    @player = users(:one)
    @params = { :game_id => @game.id, :player_id => @player.id };
    @play = Play.new(@params)
    @play.save
    assert_equal @game.id, @play.game.id 
    assert_equal @player.id, @play.player.id
    assert_equal 2, @play.player_challenges.count, "Too litle challenges"
    assert_equal "CapturingCode", @play.player_challenges[0].class.to_s
    assert_equal "EnteringMessage", @play.player_challenges[1].class.to_s
  end
end

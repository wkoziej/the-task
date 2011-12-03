require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "new_game_has_status_new" do
    game = Game.new 
    assert game.status == "NEW"
  end
end

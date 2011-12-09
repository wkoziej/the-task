require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "new_game_has_status_new" do
    game = Game.new 
    assert game.new? 
  end

  test "activation_of_game" do
    game = Game.new 
    game.activate!
    assert game.active?
    assert !game.new?
  end

end

require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "new_game_has_status_new" do
    game = Game.new 
    assert game.new? 
  end

  test "activation_of_empty_game" do
    game = Game.new 
    assert  (not game.activate)
  end

  test "change status from parameters" do
    game = Game.new
    assert (not game.archive)
    assert game.new?, "Zmiana statusu niespodziewanie sie udala"
    assert (not game.errors[:status].empty?), "Po bledzie, powinny byc informacje o tym"   
    game.activate
    assert (not game.active?), "Nie mozna aktywowac gry bez wyzwan"
    
    game.challenges << challenges(:enterMessage)
    game.activate
    assert game.active?, "Gra posiada wyzwania i nie udalo sie aktywowac"
    game.archive
    assert game.archived?
  end

end

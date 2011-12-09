# -*- coding: utf-8 -*-
class PopulateGames < ActiveRecord::Migration
  def up
    game = Game.new
    game.creator = User.find(1)
    game.title = 'Collect two codes!'
    game.description = 'Visit interesting places. Collect two codes.'
    game.save()
  end

  def down
  end
end

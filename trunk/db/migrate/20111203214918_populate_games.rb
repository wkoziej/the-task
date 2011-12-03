# -*- coding: utf-8 -*-
class PopulateGames < ActiveRecord::Migration
  def up
    game = Game.new
    game.creator = User.find(1)
    game.title = 'Znajdź dwa kody!'
    game.description = 'Zdobądź dwa kody i wpisz je do systemu. Nagrody czekają...'
    game.status = "ACTIVE"
    game.save()
  end

  def down
  end
end

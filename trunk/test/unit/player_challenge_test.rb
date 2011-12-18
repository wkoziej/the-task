# -*- coding: utf-8 -*-
require 'test_helper'

class PlayerChallengeTest < ActiveSupport::TestCase

  test "has_status_unfinished" do
    playerChallenge = PlayerChallenge.new 
    assert playerChallenge.unfinished? 
  end

  test "increase points" do
    playerChallenge = player_challenges(:capturingCode)
    assert playerChallenge.unfinished?, "Status różny od niezakończony"
   # @c = playerChallenge.challenge
   # @u = playerChallenge.play.player
   # @mark = Mark.find_or_create_by_user_id_and_pointSum(@u, @c)
   # assert (@mark.pointSum  == 0)
    assert (not playerChallenge.finish), "Udało się zakończyć, mimo że brak kodu"
    playerChallenge.code = "123"
    @u1 = playerChallenge.play.player.pointSum(playerChallenge.challenge.pointKind)
    assert (playerChallenge.finish), "Nie udało się zakończyć"
    @u2 = playerChallenge.play.player.pointSum(playerChallenge.challenge.pointKind)
    assert playerChallenge.finished?, "Status nie zmienił się na zakończony"
    assert (@u2 > @u1), ("Nie zwiększona liczba punków " + @u1.to_s + " " + @u2.to_s)
  end

end

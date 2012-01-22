# -*- coding: utf-8 -*-
require 'test_helper'

class PlayerChallengeTest < ActiveSupport::TestCase

  test "has_status_unfinished" do
    playerChallenge = PlayerChallenge.new 
    assert playerChallenge.unfinished? 
  end

  test "increase points" do
    playerChallenge = player_challenges(:capturingCode)
    assert playerChallenge.unfinished?, "Challenge not finished"
    assert (not playerChallenge.finish), "We finished!"
    playerChallenge.code = "123"
    @u1 = playerChallenge.play.player.point_sum(playerChallenge.challenge.point_kind)
    assert (playerChallenge.finish), "We cant finish!"
#    playerChallenge.save
    @u2 = playerChallenge.play.player.point_sum(playerChallenge.challenge.point_kind)
    assert playerChallenge.finished?, "Wrong status"
    assert (@u2 > @u1), ("Points not increased " + @u1.to_s + " " + @u2.to_s)
  end

  test "last challenge ends play" do
    @play = plays(:p1)
    assert @play.started?, "Play not started"
    assert @play.player_challenges.count == 2, "Play has wrong no of challenges"
    @play.player_challenges.each  do |c|
      c.code  = "123"
      assert c.finish, "Cannot finish challange"
      assert c.finished? , "Challenge not finished"
    end
    @play.reload
    assert @play.finished?, "Play not finished"
    assert @play.finished_at != nil, "Finish date missing"
  end

end

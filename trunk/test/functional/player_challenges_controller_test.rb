# -*- coding: utf-8 -*-
require 'test_helper'

class PlayerChallengesControllerTest < ActionController::TestCase
  
  setup do
    @capturingCode = CapturingCode.find( player_challenges(:capturingCode))
    @enteringMessage = EnteringMessage.find( player_challenges(:enteringMessage))
    @user = User.find(users(:one))
    sign_in @user   
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:player_challenges)
  end

  # test "should show player_challenge" do
  #   get :show, :id => @capturingCode.to_param
  #   assert_response :success
  # end

end

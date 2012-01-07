# -*- coding: utf-8 -*-
require 'test_helper'

class PlayerChallengesControllerTest < ActionController::TestCase
  
  setup do
    @capturingCode = CapturingCode.find( player_challenges(:capturingCode))
    @enteringMessage = EnteringMessage.find( player_challenges(:enteringMessage))
    @user = User.find(users(:one))
    @play = plays(:one)
    sign_in @user   
  end

  test "should get index" do
    get :index, :player_id => @user.to_param 
    assert_response :success
    assert_not_nil assigns(:player_challenges)
  end


  test "should get edit" do
    get :edit, :id => @capturingCode.id
    assert_response :success
  end

  test "should update capturing_code" do
    put :update, :id => @capturingCode.to_param, :player_challenge => {  }
    # Wracamy do edycji bo kod pusty
    assert_template :edit, @response.body     
    put :update, :id => @capturingCode.to_param, :player_challenge => { :code => "not empty" }
    assert_redirected_to play_path(@capturingCode.play)
  end

  test "should update entering_message" do
    put :update, :id => @enteringMessage.to_param, :player_challenge => {  }
    # Wracamy do edycji bo kod pusty
    assert_template :edit, @response.body     
    put :update, :id => @enteringMessage.to_param, :player_challenge => { :message => "not empty" }
    assert_redirected_to play_path(@enteringMessage.play)
  end

end

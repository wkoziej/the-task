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

  test "should show player_challenge" do
    get :show, :id => @capturingCode.to_param
    assert_response :success
  end


  # test "should update entering message" do
  #   put :update, :id => @enteringMessage.to_param, :player_challenge => {  }
  #   # Wracamy do edycji bo message pusty
  #   assert_template :edit, "Powinnismy powrócić do edycji jeżeli nie wpisano wiadomosci"
  #   put :update, :id => @enteringMessage.to_param, :player_challenge => { :message => "Message not empty" }
  #   assert_redirected_to entering_message_path(assigns(:player_challenge))

  # end

  test "should destroy player_challenge" do
    assert_difference('PlayerChallenge.count', -1) do
      delete :destroy, :id => @capturingCode.to_param
    end

    assert_redirected_to player_challenges_path
  end
end

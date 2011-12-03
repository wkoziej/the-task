require 'test_helper'

class PlayerChallengesControllerTest < ActionController::TestCase
  setup do
    @player_challenge = player_challenges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:player_challenges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player_challenge" do
    assert_difference('PlayerChallenge.count') do
      post :create, :player_challenge => @player_challenge.attributes
    end

    assert_redirected_to player_challenge_path(assigns(:player_challenge))
  end

  test "should show player_challenge" do
    get :show, :id => @player_challenge.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @player_challenge.to_param
    assert_response :success
  end

  test "should update player_challenge" do
    put :update, :id => @player_challenge.to_param, :player_challenge => @player_challenge.attributes
    assert_redirected_to player_challenge_path(assigns(:player_challenge))
  end

  test "should destroy player_challenge" do
    assert_difference('PlayerChallenge.count', -1) do
      delete :destroy, :id => @player_challenge.to_param
    end

    assert_redirected_to player_challenges_path
  end
end

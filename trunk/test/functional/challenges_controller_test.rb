require 'test_helper'

class ChallengesControllerTest < ActionController::TestCase

  fixtures :users

  setup do
    @captureCode = challenges(:captureCode)
    @enterMessage = challenges(:enterMessage)
    @game = Game.find(games(:one))
    @user = User.find(users(:one))
    sign_in @user 
  end

  test "should get index" do
    get :index, :game_id => @game.id
    assert_response :success
    assert_not_nil assigns(:challenges)
  end

  test "should get new" do
    get :new, :game_id => @game.id
    assert_response :success
  end

  test "should create capture code challenge" do
    assert_difference('Challenge.count') do
      post :create, :game_id => @game.id, :challenge => {:type => @captureCode.type, :title => @captureCode.title, 
        :points => @captureCode.points, :pointKind_id => @captureCode.pointKind.id, :description =>  @captureCode.description, :type => "CaptureCode" } 
    end

    assert_redirected_to game_challenge_path(@game, assigns(:challenge))
  end

  # test "should create enter message challenge" do
  #   assert_difference('Challenge.count') do
  #     post :create, :game_id => @game.id, :challenge => {:type => @enterMessage.type, :title => @enterMessage.title, :points => @enterMessage.points, :pointKind => @enterMessage.pointKind} 
  #   end
  #   assert_redirected_to game_challenge_path(@game, assigns(:challenge))
  # end


  test "should show challenge" do
    get :show, :game_id => @game.id, :id => @captureCode.to_param
    assert_response :success
    get :show, :game_id => @game.id, :id => @enterMessage.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :game_id => @game.id, :id => @captureCode.to_param
    assert_response :success
    get :edit, :game_id => @game.id, :id => @enterMessage.to_param
    assert_response :success
  end

  test "should update capture code" do
    put :update, :game_id => @game.id, :id => @captureCode.to_param, :challenge => { :title => "New title" }
    assert_redirected_to game_challenge_path(@game, assigns( :challenge))
  end


  test "should update enter message" do
    put :update, :game_id => @game.id, :id => @enterMessage.to_param, :challenge => { :title => "New title"}
    assert_redirected_to game_challenge_path(@game, assigns(:challenge))
  end

  test "should destroy challenge" do
    assert_difference('Challenge.count', -1) do
      delete :destroy, :game_id => @game.id, :id => @captureCode.to_param
    end

    assert_redirected_to game_challenges_path(@game)

    assert_difference('Challenge.count', -1) do
      delete :destroy, :game_id => @game.id, :id => @enterMessage.to_param
    end

    assert_redirected_to game_challenges_path(@game)
  end
end

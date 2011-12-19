require 'test_helper'

class PlaysControllerTest < ActionController::TestCase
  setup do
    @play = plays(:one)
    @user = User.find(users(:one))
    sign_in @user   
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plays)
  end

  test "should create play" do
    assert_difference('Play.count') do
      post :create, :play => @play.attributes
    end

    assert_redirected_to play_path(assigns(:play))
  end

  test "should show play" do
    get :show, :id => @play.to_param
    assert_response :success
  end


  test "should update play" do
    put :update, :id => @play.to_param, :play => @play.attributes
    assert_redirected_to play_path(assigns(:play))
  end

end

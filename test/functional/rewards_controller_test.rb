require 'test_helper'

class RewardsControllerTest < ActionController::TestCase

  setup do
    @reward = rewards(:one)
    @user = User.find(users(:one))
    sign_in @user   
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rewards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reward" do
    assert_difference('Reward.count') do
      post :create, :reward => @reward.attributes
    end

    assert_redirected_to reward_path(assigns(:reward))
  end

  test "should show reward" do
    get :show, :id => @reward.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @reward.to_param
    assert_response :success
  end

  test "should update reward" do
    put :update, :id => @reward.to_param, :reward => @reward.attributes
    assert_redirected_to reward_path(assigns(:reward))
  end

  test "should destroy reward" do
    assert_difference('Reward.count', -1) do
      delete :destroy, :id => @reward.to_param
    end

    assert_redirected_to rewards_path
  end

  test "should get collect reward" do
    @user = User.find(users(:rich))
    @reward = rewards(:reward_available)
    sign_in @user   
    get :collect, :id => @reward.to_param
    assert_redirected_to reward_path(@reward)
  end

end

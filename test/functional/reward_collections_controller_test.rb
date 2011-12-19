require 'test_helper'

class RewardCollectionsControllerTest < ActionController::TestCase
  setup do
    @reward_collection = reward_collections(:one)
    @user = User.find(users(:one))
    sign_in @user   
  end

  test "should get index" do
    get :index, :player_id => @user.to_param
    assert_response :success
    assert_not_nil assigns(:reward_collections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reward_collection" do
    assert_difference('RewardCollection.count') do
      post :create, :reward_collection => @reward_collection.attributes
    end
    assert_redirected_to reward_collection_path(assigns(:reward_collection))
  end

  test "should show reward_collection" do
    get :show, :id => @reward_collection.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @reward_collection.to_param
    assert_response :success
  end


end

require 'test_helper'

class ChallengesControllerTest < ActionController::TestCase

  fixtures :users

  setup do
    @captureCode = challenges(:captureCode)
    @enterMessage = challenges(:enterMessage)

    @user = User.find(users(:one))
    sign_in @user 
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:challenges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create capture code challenge" do
    assert_difference('Challenge.count') do
      post :create, :challenge => {:type => @captureCode.type, :title => @captureCode.title, :points => @captureCode.points, :pointKind => @captureCode.pointKind} 
    end

    assert_redirected_to challenge_path(assigns(:challenge))
  end

  test "should create enter message challenge" do
    assert_difference('Challenge.count') do
      post :create, :challenge => {:type => @enterMessage.type, :title => @enterMessage.title, :points => @enterMessage.points, :pointKind => @enterMessage.pointKind} 
    end
    assert_redirected_to challenge_path(assigns(:challenge))
  end


  test "should show challenge" do
    get :show, :id => @captureCode.to_param
    assert_response :success
    get :show, :id => @enterMessage.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @captureCode.to_param
    assert_response :success
    get :edit, :id => @enterMessage.to_param
    assert_response :success
  end

  test "should update capture code" do
    put :update, :id => @captureCode.to_param, :challenge => { :title => "New title" }
    assert_redirected_to capture_code_path(assigns(:challenge))
  end


  test "should update enter message" do
    put :update, :id => @enterMessage.to_param, :challenge => { :title => "New title"}
    assert_redirected_to enter_message_path(assigns(:challenge))
  end

  test "should destroy challenge" do
    assert_difference('Challenge.count', -1) do
      delete :destroy, :id => @captureCode.to_param
    end

    assert_redirected_to challenges_path

    assert_difference('Challenge.count', -1) do
      delete :destroy, :id => @enterMessage.to_param
    end

    assert_redirected_to challenges_path
  end
end

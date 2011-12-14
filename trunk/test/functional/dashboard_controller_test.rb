require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  setup do
    @user = User.find(users(:one))
    sign_in @user   
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end

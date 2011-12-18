require 'test_helper'

class CapturingCodesControllerTest < ActionController::TestCase
  
  setup do
    @capturingCode = CapturingCode.find( player_challenges(:capturingCode))
    @user = User.find(users(:one))
    sign_in @user   
  end

  test "should get edit" do
    get :edit, :id => @capturingCode
    assert_response :success
  end

  test "should update capturing_code" do
    put :update, :id => @capturingCode.to_param, :capturing_code => {  }
    # Wracamy do edycji bo kod pusty
    assert_template :edit, @response.body 

    put :update, :id => @capturingCode.to_param, :capturing_code => { :code => "not empty" }
    assert_redirected_to play_path(@capturingCode.play)
     
  end


end

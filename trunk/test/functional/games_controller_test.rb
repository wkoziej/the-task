# -*- coding: utf-8 -*-
require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  setup do
    @game = Game.find(games(:one))
    @user = User.find(users(:one))
    sign_in @user 
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:games)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game" do
    assert_difference('Game.count') do
      post :create, :game => {:title => "Title of the game", :description => "Description of the game" } 
    end

    assert_redirected_to game_path(assigns(:game))
  end

  test "should show game" do
    get :show, :id => @game.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @game.to_param
    assert_response :success
  end

  test "should update game" do
    put :update, :id => @game.to_param, :game => { :description => "New desc" }
    assert_redirected_to game_path(assigns(:game))
  end

  test "should destroy game" do
    assert_difference('Game.count', -1) do
      delete :destroy, :id => @game.to_param
    end
    assert_redirected_to games_path
  end

  test "disability to modify someone else game" do
    # @game_of_user_two = games(:game_of_user_two)
    #get :edit, :id => @game_of_user_two.to_param
    # Użytkownik :one nie może edytować gry użytkownika :two
    #assert_redirected_to :controller => 'dashboard'
  end

end

require 'test_helper'

class PlayerOptionsControllerTest < ActionController::TestCase
  setup do
    @player_option = player_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:player_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player_option" do
    assert_difference('PlayerOption.count') do
      post :create, player_option: { can_roll: @player_option.can_roll, game_id: @player_option.game_id }
    end

    assert_redirected_to player_option_path(assigns(:player_option))
  end

  test "should show player_option" do
    get :show, id: @player_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player_option
    assert_response :success
  end

  test "should update player_option" do
    patch :update, id: @player_option, player_option: { can_roll: @player_option.can_roll, game_id: @player_option.game_id }
    assert_redirected_to player_option_path(assigns(:player_option))
  end

  test "should destroy player_option" do
    assert_difference('PlayerOption.count', -1) do
      delete :destroy, id: @player_option
    end

    assert_redirected_to player_options_path
  end
end

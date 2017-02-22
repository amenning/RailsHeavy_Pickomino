require 'test_helper'

class PlayerWormsControllerTest < ActionController::TestCase
  setup do
    @player_worm = player_worms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:player_worms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player_worm" do
    assert_difference('PlayerWorm.count') do
      post :create, player_worm: { game_state_id: @player_worm.game_state_id, player_id: @player_worm.player_id, worm_id: @player_worm.worm_id }
    end

    assert_redirected_to player_worm_path(assigns(:player_worm))
  end

  test "should show player_worm" do
    get :show, id: @player_worm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player_worm
    assert_response :success
  end

  test "should update player_worm" do
    patch :update, id: @player_worm, player_worm: { game_state_id: @player_worm.game_state_id, player_id: @player_worm.player_id, worm_id: @player_worm.worm_id }
    assert_redirected_to player_worm_path(assigns(:player_worm))
  end

  test "should destroy player_worm" do
    assert_difference('PlayerWorm.count', -1) do
      delete :destroy, id: @player_worm
    end

    assert_redirected_to player_worms_path
  end
end

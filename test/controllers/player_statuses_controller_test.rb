require 'test_helper'

class PlayerStatusesControllerTest < ActionController::TestCase
  setup do
    @player_status = player_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:player_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player_status" do
    assert_difference('PlayerStatus.count') do
      post :create, player_status: { game_state_id: @player_status.game_state_id, player_id: @player_status.player_id, score: @player_status.score }
    end

    assert_redirected_to player_status_path(assigns(:player_status))
  end

  test "should show player_status" do
    get :show, id: @player_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player_status
    assert_response :success
  end

  test "should update player_status" do
    patch :update, id: @player_status, player_status: { game_state_id: @player_status.game_state_id, player_id: @player_status.player_id, score: @player_status.score }
    assert_redirected_to player_status_path(assigns(:player_status))
  end

  test "should destroy player_status" do
    assert_difference('PlayerStatus.count', -1) do
      delete :destroy, id: @player_status
    end

    assert_redirected_to player_statuses_path
  end
end

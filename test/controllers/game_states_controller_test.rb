require 'test_helper'

class GameStatesControllerTest < ActionController::TestCase
  setup do
    @game_state = game_states(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:game_states)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game_state" do
    assert_difference('GameState.count') do
      post :create, game_state: { game_id: @game_state.game_id }
    end

    assert_redirected_to game_state_path(assigns(:game_state))
  end

  test "should show game_state" do
    get :show, id: @game_state
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game_state
    assert_response :success
  end

  test "should update game_state" do
    patch :update, id: @game_state, game_state: { game_id: @game_state.game_id }
    assert_redirected_to game_state_path(assigns(:game_state))
  end

  test "should destroy game_state" do
    assert_difference('GameState.count', -1) do
      delete :destroy, id: @game_state
    end

    assert_redirected_to game_states_path
  end
end

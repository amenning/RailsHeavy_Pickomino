require 'test_helper'

class PlayerWormSetsControllerTest < ActionController::TestCase
  setup do
    @player_worm_set = player_worm_sets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:player_worm_sets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player_worm_set" do
    assert_difference('PlayerWormSet.count') do
      post :create, player_worm_set: { game_id: @player_worm_set.game_id, player_id: @player_worm_set.player_id }
    end

    assert_redirected_to player_worm_set_path(assigns(:player_worm_set))
  end

  test "should show player_worm_set" do
    get :show, id: @player_worm_set
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player_worm_set
    assert_response :success
  end

  test "should update player_worm_set" do
    patch :update, id: @player_worm_set, player_worm_set: { game_id: @player_worm_set.game_id, player_id: @player_worm_set.player_id }
    assert_redirected_to player_worm_set_path(assigns(:player_worm_set))
  end

  test "should destroy player_worm_set" do
    assert_difference('PlayerWormSet.count', -1) do
      delete :destroy, id: @player_worm_set
    end

    assert_redirected_to player_worm_sets_path
  end
end

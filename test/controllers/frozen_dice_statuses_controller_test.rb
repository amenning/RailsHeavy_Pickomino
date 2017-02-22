require 'test_helper'

class FrozenDiceStatusesControllerTest < ActionController::TestCase
  setup do
    @frozen_dice_status = frozen_dice_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:frozen_dice_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create frozen_dice_status" do
    assert_difference('FrozenDiceStatus.count') do
      post :create, frozen_dice_status: { game_state_id: @frozen_dice_status.game_state_id, has_worm: @frozen_dice_status.has_worm, total: @frozen_dice_status.total }
    end

    assert_redirected_to frozen_dice_status_path(assigns(:frozen_dice_status))
  end

  test "should show frozen_dice_status" do
    get :show, id: @frozen_dice_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @frozen_dice_status
    assert_response :success
  end

  test "should update frozen_dice_status" do
    patch :update, id: @frozen_dice_status, frozen_dice_status: { game_state_id: @frozen_dice_status.game_state_id, has_worm: @frozen_dice_status.has_worm, total: @frozen_dice_status.total }
    assert_redirected_to frozen_dice_status_path(assigns(:frozen_dice_status))
  end

  test "should destroy frozen_dice_status" do
    assert_difference('FrozenDiceStatus.count', -1) do
      delete :destroy, id: @frozen_dice_status
    end

    assert_redirected_to frozen_dice_statuses_path
  end
end

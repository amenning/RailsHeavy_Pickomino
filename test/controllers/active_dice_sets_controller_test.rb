require 'test_helper'

class ActiveDiceSetsControllerTest < ActionController::TestCase
  setup do
    @active_dice_set = active_dice_sets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:active_dice_sets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create active_dice_set" do
    assert_difference('ActiveDiceSet.count') do
      post :create, active_dice_set: { can_freeze: @active_dice_set.can_freeze, dice_id: @active_dice_set.dice_id, game_state_id: @active_dice_set.game_state_id }
    end

    assert_redirected_to active_dice_set_path(assigns(:active_dice_set))
  end

  test "should show active_dice_set" do
    get :show, id: @active_dice_set
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @active_dice_set
    assert_response :success
  end

  test "should update active_dice_set" do
    patch :update, id: @active_dice_set, active_dice_set: { can_freeze: @active_dice_set.can_freeze, dice_id: @active_dice_set.dice_id, game_state_id: @active_dice_set.game_state_id }
    assert_redirected_to active_dice_set_path(assigns(:active_dice_set))
  end

  test "should destroy active_dice_set" do
    assert_difference('ActiveDiceSet.count', -1) do
      delete :destroy, id: @active_dice_set
    end

    assert_redirected_to active_dice_sets_path
  end
end

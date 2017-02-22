require 'test_helper'

class FrozenDiceSetsControllerTest < ActionController::TestCase
  setup do
    @frozen_dice_set = frozen_dice_sets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:frozen_dice_sets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create frozen_dice_set" do
    assert_difference('FrozenDiceSet.count') do
      post :create, frozen_dice_set: { dice_id: @frozen_dice_set.dice_id, game_state_id: @frozen_dice_set.game_state_id }
    end

    assert_redirected_to frozen_dice_set_path(assigns(:frozen_dice_set))
  end

  test "should show frozen_dice_set" do
    get :show, id: @frozen_dice_set
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @frozen_dice_set
    assert_response :success
  end

  test "should update frozen_dice_set" do
    patch :update, id: @frozen_dice_set, frozen_dice_set: { dice_id: @frozen_dice_set.dice_id, game_state_id: @frozen_dice_set.game_state_id }
    assert_redirected_to frozen_dice_set_path(assigns(:frozen_dice_set))
  end

  test "should destroy frozen_dice_set" do
    assert_difference('FrozenDiceSet.count', -1) do
      delete :destroy, id: @frozen_dice_set
    end

    assert_redirected_to frozen_dice_sets_path
  end
end

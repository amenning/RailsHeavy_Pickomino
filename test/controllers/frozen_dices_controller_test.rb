require 'test_helper'

class FrozenDicesControllerTest < ActionController::TestCase
  setup do
    @frozen_dice = frozen_dices(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:frozen_dices)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create frozen_dice' do
    assert_difference('FrozenDice.count') do
      post :create, frozen_dice: { frozen_dice_set_id: @frozen_dice.frozen_dice_set_id }
    end

    assert_redirected_to frozen_dice_path(assigns(:frozen_dice))
  end

  test 'should show frozen_dice' do
    get :show, id: @frozen_dice
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @frozen_dice
    assert_response :success
  end

  test 'should update frozen_dice' do
    patch :update, id: @frozen_dice, frozen_dice: { frozen_dice_set_id: @frozen_dice.frozen_dice_set_id }
    assert_redirected_to frozen_dice_path(assigns(:frozen_dice))
  end

  test 'should destroy frozen_dice' do
    assert_difference('FrozenDice.count', -1) do
      delete :destroy, id: @frozen_dice
    end

    assert_redirected_to frozen_dices_path
  end
end

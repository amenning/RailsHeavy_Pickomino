require 'test_helper'

class ActiveDicesControllerTest < ActionController::TestCase
  setup do
    @active_dice = active_dices(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:active_dices)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create active_dice' do
    assert_difference('ActiveDice.count') do
      post :create, active_dice: { active_dice_set_id: @active_dice.active_dice_set_id, can_freeze: @active_dice.can_freeze }
    end

    assert_redirected_to active_dice_path(assigns(:active_dice))
  end

  test 'should show active_dice' do
    get :show, id: @active_dice
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @active_dice
    assert_response :success
  end

  test 'should update active_dice' do
    patch :update, id: @active_dice, active_dice: { active_dice_set_id: @active_dice.active_dice_set_id, can_freeze: @active_dice.can_freeze }
    assert_redirected_to active_dice_path(assigns(:active_dice))
  end
end

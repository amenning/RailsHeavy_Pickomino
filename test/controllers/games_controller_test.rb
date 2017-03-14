require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  test 'play action should accept html format' do
    get :play, 'Accept' => Mime::HTML
    assert_response :success
    assert_equal Mime::HTML, response.content_type
  end

  test 'play action should assign new grill worms and active dice' do
    get :play
    assert_response :success
    assert_not_nil assigns(:grill_worms)
    assert_not_nil assigns(:active_dice)
    assert_equal({}, assigns(:frozen_dice))
    assert_equal({}, assigns(:player_worms))
  end

  test 'roll action should accept js format' do
    call_roll_action
    assert_response :success
    assert_equal Mime::JS, response.content_type
  end

  test 'roll action should assign new active_dice hash' do
    call_roll_action
    assert_response :success
    assert_not_nil assigns(:active_dice)
  end

  test 'freeze_dice action should accept js format' do
    call_freeze_dice_action
    assert_response :success
    assert_equal Mime::JS, response.content_type
  end

  test 'freeze_dice action should assign new frozen_dice and active_dice hashes' do
    call_freeze_dice_action
    assert_response :success
    assert_not_nil assigns(:frozen_dice)
    assert_not_nil assigns(:active_dice)
  end

  test 'take_worm action should accept js format' do
    call_take_worm_action
    assert_response :success
    assert_equal Mime::JS, response.content_type
  end

  test 'take_worm action should assign new grill_worms and player_worms hashes' do
    call_take_worm_action
    assert_response :success
    assert_not_nil assigns(:grill_worms)
    assert_not_nil assigns(:player_worms)
  end

  private

  def call_roll_action
    xhr :get, :roll, format: 'js', 'Accept' => Mime::JS, remote: true
  end

  def call_freeze_dice_action
    xhr :post, :freeze_dice, dice: { value: 3 }, format: 'js', 'Accept' => Mime::JS, remote: true
  end

  def call_take_worm_action
    xhr :post, :take_worm, worm: { value: 3 }, format: 'js', 'Accept' => Mime::JS, remote: true
  end
end

require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  test 'play action should accept html format' do
    get :play, 'Accept' => Mime::HTML
    assert_response :success
    assert_equal Mime::HTML, response.content_type
  end

  test 'roll action should accept js format' do
    xhr :get, :roll, format: 'js', 'Accept' => Mime::JS, remote: true
    assert_response :success
    assert_equal Mime::JS, response.content_type
  end

  test 'freeze_dice action should accept js format' do
    xhr :post, :freeze_dice, dice: { value: 3 }, format: 'js', 'Accept' => Mime::JS, remote: true
    assert_response :success
    assert_equal Mime::JS, response.content_type
  end

  test 'play action should assign new gril worms and active dice' do
    get :play
    assert_response :success
    assert_not_nil assigns(:grill_worms)
    assert_not_nil assigns(:active_dice)
    assert_equal({}, assigns(:frozen_dice))
    assert_equal({}, assigns(:player_worms))
  end
end

require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  test 'should get board setup' do
    get :play
    assert_response :success
    assert_not_nil assigns(:active_dice)
  end
end

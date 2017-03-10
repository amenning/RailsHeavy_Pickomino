require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  test 'should get first_roll' do
    get :first_roll
    assert_response :success
    assert_not_nil assigns(:active_dice)
  end
end

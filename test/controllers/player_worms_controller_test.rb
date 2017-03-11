require 'test_helper'

class PlayerWormsControllerTest < ActionController::TestCase
  setup do
    @player_worm = player_worms(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:player_worms)
  end

  test 'should create player_worm' do
    assert_difference('PlayerWorm.count') do
      post :create, player_worm: { player_worm_set_id: @player_worm.player_worm_set_id }
    end

    assert_redirected_to player_worm_path(assigns(:player_worm))
  end

  test 'should show player_worm' do
    get :show, id: @player_worm
    assert_response :success
  end

  test 'should update player_worm' do
    patch :update, id: @player_worm, player_worm: { player_worm_set_id: @player_worm.player_worm_set_id }
    assert_redirected_to player_worm_path(assigns(:player_worm))
  end
end

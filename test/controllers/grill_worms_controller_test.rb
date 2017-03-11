require 'test_helper'

class GrillWormsControllerTest < ActionController::TestCase
  setup do
    @grill_worm = grill_worms(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:grill_worms)
  end

  test 'should create grill_worm' do
    assert_difference('GrillWorm.count') do
      post :create, grill_worm: { can_take: @grill_worm.can_take, is_dead: @grill_worm.is_dead }
    end

    assert_redirected_to grill_worm_path(assigns(:grill_worm))
  end

  test 'should show grill_worm' do
    get :show, id: @grill_worm
    assert_response :success
  end

  test 'should update grill_worm' do
    patch :update, id: @grill_worm, grill_worm: { can_take: @grill_worm.can_take, is_dead: @grill_worm.is_dead }
    assert_redirected_to grill_worm_path(assigns(:grill_worm))
  end
end

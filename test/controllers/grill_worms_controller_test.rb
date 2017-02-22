require 'test_helper'

class GrillWormsControllerTest < ActionController::TestCase
  setup do
    @grill_worm = grill_worms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grill_worms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grill_worm" do
    assert_difference('GrillWorm.count') do
      post :create, grill_worm: { can_take: @grill_worm.can_take, grill_id: @grill_worm.grill_id, is_dead: @grill_worm.is_dead, worm_id: @grill_worm.worm_id }
    end

    assert_redirected_to grill_worm_path(assigns(:grill_worm))
  end

  test "should show grill_worm" do
    get :show, id: @grill_worm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grill_worm
    assert_response :success
  end

  test "should update grill_worm" do
    patch :update, id: @grill_worm, grill_worm: { can_take: @grill_worm.can_take, grill_id: @grill_worm.grill_id, is_dead: @grill_worm.is_dead, worm_id: @grill_worm.worm_id }
    assert_redirected_to grill_worm_path(assigns(:grill_worm))
  end

  test "should destroy grill_worm" do
    assert_difference('GrillWorm.count', -1) do
      delete :destroy, id: @grill_worm
    end

    assert_redirected_to grill_worms_path
  end
end

require 'test_helper'

class GrillsControllerTest < ActionController::TestCase
  setup do
    @grill = grills(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grill" do
    assert_difference('Grill.count') do
      post :create, grill: { game_state_id: @grill.game_state_id, grill_worm_tiles_id: @grill.grill_worm_tiles_id }
    end

    assert_redirected_to grill_path(assigns(:grill))
  end

  test "should show grill" do
    get :show, id: @grill
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grill
    assert_response :success
  end

  test "should update grill" do
    patch :update, id: @grill, grill: { game_state_id: @grill.game_state_id, grill_worm_tiles_id: @grill.grill_worm_tiles_id }
    assert_redirected_to grill_path(assigns(:grill))
  end

  test "should destroy grill" do
    assert_difference('Grill.count', -1) do
      delete :destroy, id: @grill
    end

    assert_redirected_to grills_path
  end
end

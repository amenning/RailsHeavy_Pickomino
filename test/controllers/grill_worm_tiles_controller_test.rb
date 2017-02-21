require 'test_helper'

class GrillWormTilesControllerTest < ActionController::TestCase
  setup do
    @grill_worm_tile = grill_worm_tiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grill_worm_tiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grill_worm_tile" do
    assert_difference('GrillWormTile.count') do
      post :create, grill_worm_tile: { can_take: @grill_worm_tile.can_take, grill_id: @grill_worm_tile.grill_id, is_dead: @grill_worm_tile.is_dead, worm_id: @grill_worm_tile.worm_id }
    end

    assert_redirected_to grill_worm_tile_path(assigns(:grill_worm_tile))
  end

  test "should show grill_worm_tile" do
    get :show, id: @grill_worm_tile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grill_worm_tile
    assert_response :success
  end

  test "should update grill_worm_tile" do
    patch :update, id: @grill_worm_tile, grill_worm_tile: { can_take: @grill_worm_tile.can_take, grill_id: @grill_worm_tile.grill_id, is_dead: @grill_worm_tile.is_dead, worm_id: @grill_worm_tile.worm_id }
    assert_redirected_to grill_worm_tile_path(assigns(:grill_worm_tile))
  end

  test "should destroy grill_worm_tile" do
    assert_difference('GrillWormTile.count', -1) do
      delete :destroy, id: @grill_worm_tile
    end

    assert_redirected_to grill_worm_tiles_path
  end
end

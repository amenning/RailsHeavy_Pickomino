require 'test_helper'

class WormTilesControllerTest < ActionController::TestCase
  setup do
    @worm_tile = worm_tiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:worm_tiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create worm_tile" do
    assert_difference('WormTile.count') do
      post :create, worm_tile: { image_id: @worm_tile.image_id, theme_id: @worm_tile.theme_id, value: @worm_tile.value, worm_count: @worm_tile.worm_count }
    end

    assert_redirected_to worm_tile_path(assigns(:worm_tile))
  end

  test "should show worm_tile" do
    get :show, id: @worm_tile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @worm_tile
    assert_response :success
  end

  test "should update worm_tile" do
    patch :update, id: @worm_tile, worm_tile: { image_id: @worm_tile.image_id, theme_id: @worm_tile.theme_id, value: @worm_tile.value, worm_count: @worm_tile.worm_count }
    assert_redirected_to worm_tile_path(assigns(:worm_tile))
  end

  test "should destroy worm_tile" do
    assert_difference('WormTile.count', -1) do
      delete :destroy, id: @worm_tile
    end

    assert_redirected_to worm_tiles_path
  end
end

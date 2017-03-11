require 'test_helper'

class WormsControllerTest < ActionController::TestCase
  setup do
    @worm = worms(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:worms)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create worm' do
    assert_difference('Worm.count') do
      post :create, worm: { value: @worm.value, worm_count: @worm.worm_count }
    end

    assert_redirected_to worm_path(assigns(:worm))
  end

  test 'should show worm' do
    get :show, id: @worm
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @worm
    assert_response :success
  end

  test 'should update worm' do
    patch :update, id: @worm, worm: { value: @worm.value, worm_count: @worm.worm_count }
    assert_redirected_to worm_path(assigns(:worm))
  end
end

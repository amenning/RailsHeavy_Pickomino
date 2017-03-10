require 'test_helper'

class ImagesControllerTest < ActionController::TestCase
  setup do
    @image = images(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:images)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create image' do
    assert_difference('Image.count') do
      post :create, image: { description: @image.description, filename: @image.filename, filetype: @image.filetype, target: @image.target, theme_id: @image.theme_id }
    end

    assert_redirected_to image_path(assigns(:image))
  end

  test 'should show image' do
    get :show, id: @image
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @image
    assert_response :success
  end

  test 'should update image' do
    patch :update, id: @image, image: { description: @image.description, filename: @image.filename, filetype: @image.filetype, target: @image.target, theme_id: @image.theme_id }
    assert_redirected_to image_path(assigns(:image))
  end
end

require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test 'should create user' do
    assert_difference('User.count') do
      post :create, format: 'json', user: { email: @user.email, firstname: @user.firstname, lastname: @user.lastname, password_digest: @user.password_digest, username: @user.username + '123456' }
    end

    assert_response :success
  end
end

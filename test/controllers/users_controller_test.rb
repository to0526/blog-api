require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @new_user = FactoryBot.build(:user)
    @user = FactoryBot.create(:user)
  end

  test "should get index" do
    get users_url, as: :json, headers: { "Authorization": "Token #{@user.token}" }
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: {
        user: {
          email: @new_user.email,
          password: @new_user.password,
          password_confirmation: @new_user.password_confirmation
        }
      }, as: :json
    end

    assert_response 201
  end

  test "should show user" do
    get user_url(@user), as: :json, headers: { "Authorization": "Token #{@user.token}" }
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: {
      user: {
        email: @user.email,
        password: @user.password,
        password_confirmation: @user.password_confirmation
      }
    },
    as: :json,
    headers: { "Authorization": "Token #{@user.token}" }
    assert_response 200
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user), as: :json, headers: { "Authorization": "Token #{@user.token}" }
    end

    assert_response 204
  end
end

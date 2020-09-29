require 'test_helper'

class AuthTokenControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user)
  end

  test "メールアドレスとパスワードが正しい" do
    post sign_in_url, params: {
      user: {
        email: @user.email,
        password: @user.password
      }
    }, as: :json

    assert_response :ok
    assert_equal(@user.token, response.parsed_body)
  end

  test "パスワードが間違えている" do
    post sign_in_url, params: {
      user: {
        email: @user.email,
        password: "wrong_password"
      }
    }, as: :json

    assert_response :unauthorized
  end

  test "メールアドレスが間違えている" do
    post sign_in_url, params: {
      user: {
        email: "wrong_email@example.com",
        password: @user.password
      }
    }, as: :json

    assert_response :unauthorized
  end
end

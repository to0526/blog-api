require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = FactoryBot.build(:user,
                             email: "test@example.com",
                             password: "password",
                             password_confirmation: "password")
  end

  test "validation email" do
    @user.email = ""
    @user.valid?
    assert_equal(["を入力してください", "は不正な値です"], @user.errors[:email])

    @user.email = "a"
    @user.valid?
    assert_equal(["は不正な値です"], @user.errors[:email])
  end

  test "validation password" do
    @user.password = " "
    @user.valid?
    assert_equal(["を入力してください", "は6文字以上で入力してください"], @user.errors[:password])

    @user.password = "a" * 5
    @user.valid?
    assert_equal(["は6文字以上で入力してください"], @user.errors[:password])

    @user.password = "a" * 6
    @user.valid?
    assert_equal(["とパスワードの入力が一致しません"], @user.errors[:password_confirmation])
  end
end

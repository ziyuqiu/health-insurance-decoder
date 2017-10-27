require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "123456")
  end

  test "should be valid" do
    @user.must_be :valid?
  end

  test "name should be present" do
    @user.name = "     "
    @user.must_be :present?
    #@user.errors[:name].must_be :present?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
    #user.errors[:email].must_be :present?
  end

  test "user email should be unique" do
    @duplicate_user = User.create(name: "Example User2", email: "user@example.com", password: "123456")
    @user.email.wont_be_same_as @duplicate_user.email
  end

  test "password should be present" do
    @user.password = "     "
    assert_not @user.valid?
  end

end

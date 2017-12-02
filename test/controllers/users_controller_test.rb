require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:potter)
    @other_user = users(:cage)
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { name: "Catherine Earnshaw", email: "cearnshaw@wuthering-heights.net", password: "itsmecathy", password_confirmation: "itsmecathy" } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should update user" do
    log_in_as(@user)
    patch user_url(@user), params: { user: { contact_id: @user.contact_id, name: @user.name } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    log_in_as(@user)
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end

  test "only user can destroy their own account" do
    log_in_as(@other_user)
    assert_difference('User.count', 0) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end

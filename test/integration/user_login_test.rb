require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:potter)
  end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
  end  


  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    delete logout_path
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end

  
  test "welcome msg shows on homepage with login" do
    get root_url
    assert_select "div.alert-success", count: 0
    assert_select "div.alert-danger", "Please sign in to view more.", count: 1
    
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert is_logged_in?
    follow_redirect!
    get root_url
    assert_select "div.alert-success", count: 1
    assert_select "div.alert-success", "You are logged in as Harry Potter.", count: 1
    assert_select "div.alert-danger", count: 0

    delete logout_path
    get root_url
    assert_select "div.alert-success", count: 0
    assert_select "div.alert-danger", "Please sign in to view more.", count: 1
  end

end

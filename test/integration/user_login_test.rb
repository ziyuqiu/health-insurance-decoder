require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:potter)
  end

  test "login with invalid information" do
    get root_path    
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information" do
    get root_path    
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert_redirected_to root_url
    follow_redirect!
    assert_template 'home/_profile'
    assert_template 'home/index'
  end  

  test "login with valid information followed by logout" do
    get root_path    
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_template 'home/_profile'
    assert_template 'home/index'
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
  end

  test "user profile is hidden if no users are logged in" do
    get root_path
    assert_response :success
    assert_select "#name", false
    assert_select "#logo", false
    assert_select ".text-primary", "New user? Sign up now!"
    assert_select ".alert-danger", "Please sign in to view more."
  end

  test "show user profile if a user is logged in" do
    get root_path    
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select ".text-primary", false
    assert_select ".alert-danger", false
    assert_select "#name", true
    assert_select "#logo", true
  end

  test "logs are hidden if no users are logged in" do    
    get logs_path
    assert_response :success
    assert_select "h1", "Log in"
    assert_select "#log-history-container", false    
  end

  test "show logs if a user is logged in" do
    get logs_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert is_logged_in?
    assert_redirected_to logs_url
    follow_redirect!    
    assert_select "#log-history-container", true
  end
end

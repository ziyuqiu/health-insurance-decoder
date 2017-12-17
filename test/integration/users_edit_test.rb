require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:potter)
    @new_plan = plans(:happy)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name:  "",
                                              email: "foo@invalid",
                                              password:              "foo",
                                              password_confirmation: "bar" } }

    assert_template 'users/edit'
  end

  test "successful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    name  = "Foo Bar"
    email = "foo@bar.com"
    plan_name = @new_plan.name    
    patch user_path(@user), params: { user: { name:  name,
                                              email: email,
                                              password:              "password",
                                              password_confirmation: "password" },
                                      plan_id: @new_plan.id }
    assert_not flash.empty?
    assert_redirected_to root_url
    @user.reload
    assert_equal name,  @user.name
    assert_equal email, @user.email
    assert_equal plan_name, @user.plans.first.name
  end

  test "show plan calculator if users has an insurance plan" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    plan_name = @new_plan.name
    patch user_path(@user), params: { user: { name: @user.name, email: @user.email }, plan_id: @new_plan.id }
    assert_not flash.empty?
    assert_redirected_to root_url
    @user.reload
    assert_equal plan_name, @user.plans.first.name
    get resources_path
    assert_response :success
    assert_select "#copay_calculator_link", "moneyCopay Calculator"
  end
end

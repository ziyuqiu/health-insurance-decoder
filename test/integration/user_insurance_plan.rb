require 'test_helper'

class UsersInsurancePlanTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:potter)
    @new_plan = plans(:happy)
  end
  
  test "do not show plan calculator unless user is logged in" do
    get resources_path
    assert_response :success
    assert_select "#copay_calculator_link", false
  end

  test "do not show plan calculater if user does not have an insurance plan" do
    log_in_as(@user)
    get resources_path
    assert_response :success
    assert_select "#copay_calculator_link", false
  end
  
  test "show plan calculator if user has an insurance plan" do
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

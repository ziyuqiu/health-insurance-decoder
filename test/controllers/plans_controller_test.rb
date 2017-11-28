require 'test_helper'

class PlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plan = plans(:happy)
    @company = companies(:dunkin)
    @bestest_care_plan = @company.plans.build(
      name: "Bestest Health Care :)",
      outpatient_copay: 0.0,
      inpatient_copay: 0.0
    )
  end

  test "should be valid first" do
    assert @plan.valid?
  end

  test "should be valid second" do
    assert @bestest_care_plan.valid?
  end

=begin
  test "should get index" do
    get plans_url
    assert_response :success
  end

  test "should get new" do
    get new_plan_url
    assert_response :success
  end

  test "should create plan" do
    assert_difference('Plan.count') do
      post plans_url, params: { plan: { category: @bestest_care_plan.category, company_id: @bestest_care_plan.company_id, name: @plan.name } }
    end

    assert_redirected_to plan_url(Plan.last)
  end

  test "should show plan" do
    get plan_url(@plan)
    assert_response :success
  end

  test "should get edit" do
    get edit_plan_url(@plan)
    assert_response :success
  end

  test "should update plan" do
    patch plan_url(@plan), params: { plan: { category: @plan.category, company_id: @plan.company_id, name: @plan.name } }
    assert_redirected_to plan_url(@plan)
  end

  test "should destroy plan" do
    assert_difference('Plan.count', -1) do
      delete plan_url(@plan)
    end

    assert_redirected_to plans_url
  end

  test "should get calculator" do
    get calculate_path
    assert_response :success
  end
=end
end

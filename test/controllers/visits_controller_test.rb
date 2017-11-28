require 'test_helper'

class VisitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @visit = visits(:one)
    @user = users(:potter)
  end

  test "should get index" do
    get visits_url
    assert_response :success
  end

  test "should get new" do
    get new_visit_url
    assert_response :success
  end

  # test "should create visit" do
  #   log_in_as(@user)
  #   assert_difference('Visit.count') do
  #     post visits_url, params: { visit: { time: @visit.time, type: @visit.vtype } }
  #   end

  #   assert_redirected_to visit_url(Visit.last)
  # end

  test "should show visit" do
    get visit_url(@visit)
    assert_response :success
  end

  test "should get edit" do
    get edit_visit_url(@visit)
    assert_response :success
  end

  test "should update visit" do
    patch visit_url(@visit), params: { visit: { time: @visit.time, type: @visit.vtype } }
    assert_redirected_to visit_url(@visit)
  end

  test "should destroy visit" do
    assert_difference('Visit.count', -1) do
      delete visit_url(@visit)
    end

    assert_redirected_to logs_url
  end
end

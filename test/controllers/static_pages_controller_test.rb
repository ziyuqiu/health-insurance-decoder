require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "should get emergency note" do
    get emergency_path
    assert_response :success
  end
end

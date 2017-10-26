require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get log" do
    get logs_log_url
    assert_response :success
  end

end

require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get log" do
    get static_pages_log_url
    assert_response :success
  end

end

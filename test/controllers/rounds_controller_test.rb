require 'test_helper'

class RoundsControllerTest < ActionDispatch::IntegrationTest
  test "should get history" do
    get rounds_history_url
    assert_response :success
  end

end

require 'test_helper'

class PersonalControllerTest < ActionDispatch::IntegrationTest
  test "should get history" do
    get personal_history_url
    assert_response :success
  end

end

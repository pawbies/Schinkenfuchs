require "test_helper"

class Website::RequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_website_request_url
    assert_response :success
  end
end

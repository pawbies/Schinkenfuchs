require "test_helper"

class Website::VerificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    request = website_requests(:one)

    get new_website_request_verifications_url(request_token: request.generate_token_for(:verification))
    assert_response :success

    get new_website_request_verifications_url(request_token: "abc")
    assert_redirected_to root_url
  end
end

require "test_helper"

class Pages::LegalControllerTest < ActionDispatch::IntegrationTest
  test "should get tos" do
    get tos_url
    assert_response :success
  end

  test "should get privacy" do
    get privacy_url
    assert_response :success
  end

  test "should get imprint" do
    get imprint_url
    assert_response :success
  end
end

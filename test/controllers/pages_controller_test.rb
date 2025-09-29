require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get homepage" do
    get root_url
    assert_response :success
  end

  test "should get about us" do
    get about_us_url
    assert_response :success
  end
end

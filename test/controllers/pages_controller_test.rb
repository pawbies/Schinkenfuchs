require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get homepage" do
    get root_url
    assert_response :success
  end

  test "should get process" do
    get process_url
    assert_response :success
  end

  test "should get timeline" do
    get timeline_url
    assert_response :success
  end
end

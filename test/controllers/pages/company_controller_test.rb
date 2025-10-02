require "test_helper"

class Pages::CompanyControllerTest < ActionDispatch::IntegrationTest
  test "should get about us" do
    get about_us_url
    assert_response :success
  end

  test "should get our work" do
    get our_work_url
    assert_response :success
  end

  test "should get testimonials" do
    get testimonials_url
    assert_response :success
  end
end

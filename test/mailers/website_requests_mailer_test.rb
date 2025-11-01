require "test_helper"

class WebsiteRequestsMailerTest < ActionMailer::TestCase
  setup do
    # @website_request = website_requests(:one)
    @website_request = Website::Request.take
  end

  test "verify" do
    mail = WebsiteRequestsMailer.verify(@website_request)
    assert_equal "Verify", mail.subject
    assert_equal [ @website_request.email_address ], mail.to
    assert_equal [ "noreply@schinkenfuchs.com" ], mail.from
    assert_match "Verify your Request", mail.body.encoded
  end
end

require "test_helper"

class WebsiteRequestsMailerTest < ActionMailer::TestCase
  setup do
    @site = sites(:one)
    @email = "request@test.com"
  end

  test "verify" do
    mail = WebsiteRequestsMailer.verify(@site, @email)
    assert_equal "Verify", mail.subject
    assert_equal [ @email ], mail.to
    assert_equal [ "noreply@schinkenfuchs.com" ], mail.from
    assert_match "Verify your Request", mail.body.encoded
  end
end

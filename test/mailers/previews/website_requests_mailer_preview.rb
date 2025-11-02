# Preview all emails at http://localhost:3000/rails/mailers/website_requests_mailer
class WebsiteRequestsMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/website_requests_mailer/verify
  def verify
    WebsiteRequestsMailer.verify(Website::Request.take)
  end
end

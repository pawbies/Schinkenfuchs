class WebsiteRequestsMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.website_requests_mailer.verify.subject
  #
  def verify(website_request)
    @website_request = website_request

    mail to: @website_request.email_address
  end
end

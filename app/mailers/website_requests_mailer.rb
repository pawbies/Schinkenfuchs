class WebsiteRequestsMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.website_requests_mailer.verify.subject
  #
  def verify(site, email_address)
    @site = site

    mail to: email_address
  end
end

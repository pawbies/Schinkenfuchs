class Website::RequestsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]

  def new
    @website_request = Website::Request.new
  end

  def create
    @website_request = Website::Request.new(website_request_params, status: "pending", verfied: false)

    if @website_request.save
      redirect_to root_path, notice: "Thank you for your request, you will receive an email to verify it shortly"
      WebsiteRequestsMailer.verify(@website_request).deliver_later
    else
      render :new, status: :unprocessable_content
    end
  end

  private
    def website_request_params
      params.expect(website_request: [ :title, :plan, :size, :description, :email_address ])
    end
end

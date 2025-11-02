class Website::VerificationsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  before_action :get_request_by_token, only: %i[ new create ]

  def new
  end

  def create
    redirect_to root_path
  end

  private
    def get_request_by_token
      begin
        @website_request = Website::Request.find_by_token_for!(:verification, params[:request_token])
      rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_back fallback_location: root_path, alert: "Invalid or expired token."
      end
    end
end

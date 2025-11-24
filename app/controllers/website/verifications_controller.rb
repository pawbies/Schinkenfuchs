class Website::VerificationsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  before_action :get_request_by_token, only: %i[ new create ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(**user_params, email_address: @website_request.email_address, role: "user")
    if params[:accepted_tos] != "1"
      flash.now[:alert] = "Please accept the TOS to continue."
      render :new, status: :forbidden
    elsif @user.save && @website_request.update(verified: true, user: @user)
      start_new_session_for @user
      redirect_to root_path, notice: "Your request is now being processed, check the status with your login credentials."
    else
      render :new, status: :unprocessable_content
    end
  end

  private
    def get_request_by_token
      begin
        @website_request = Website::Request.find_by_token_for!(:verification, params[:request_token])
        redirect_back fallback_location: root_path, alert: "Request was already verified." if @website_request.verified
      rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_back fallback_location: root_path, alert: "Invalid or expired token."
      end
    end

    def user_params
      params.expect(user: [ :username, :password, :password_confirmation ])
    end
end

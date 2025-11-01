class Website::RequestsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]

  def new
    @website_request = Website::Request.new
  end

  def create
    redirect_to root_path
  end
end

class Website::RequestsController < ApplicationController
  allow_unauthenticated_access only: :new

  def new
  end
end

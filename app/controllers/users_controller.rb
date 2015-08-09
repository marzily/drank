class UsersController < ApplicationController
  before_action :reroute_unauth_user

  def show
  end

  def reroute_unauth_user
    redirect_to root_path unless signed_in?
  end
end

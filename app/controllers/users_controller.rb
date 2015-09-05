class UsersController < ApplicationController
  before_action :reroute_unauth_user

  def show
    @restaurants = "hello"
    @drinks = Weather.current_range(session[:temp_f]).drinks
  end

  def reroute_unauth_user
    redirect_to root_path unless signed_in?
  end
end

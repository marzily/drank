class UsersController < ApplicationController
  before_action :reroute_unauth_user

  def show
    @drinks = Weather.current_range(session[:temp_f]).drinks
    @recommended = @drinks.sample.drink_type
    @restaurants = SearchAPI.new.businesses(@recommended, session[:location]['latitude'], session[:location]['longitude'])
  end

  def reroute_unauth_user
    redirect_to root_path unless signed_in?
  end
end

class UsersController < ApplicationController
  include UsersHelper
  before_action :reroute_unauth_user

  def show
    # @restaurants = restaurants
    @drinks = drinks_by_temp
    session[:drink_type] = @drinks.sample.drink_type
    # byebug
  end

  def reroute_unauth_user
    redirect_to root_path unless signed_in?
  end

  def drinks_by_temp
    Weather.current_range(session[:temp_f]).drinks
  end

  def restaurants
    search_client.businesses(session[:drink_type], location['latitude'], location['longitude'])
  end
end

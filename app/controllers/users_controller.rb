class UsersController < ApplicationController
  include UsersHelper
  before_action :reroute_unauth_user

  def show
    # @restaurants = restaurants
    # byebug
  end

  def reroute_unauth_user
    redirect_to root_path unless signed_in?
  end

  def restaurants
    search_client.businesses(session[:drink_type], location['latitude'], location['longitude'])
  end
end

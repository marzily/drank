class UsersController < ApplicationController
  include UsersHelper
  before_action :reroute_unauth_user

  def show
    # byebug
    # {latitude: 39.7514438, longitude: -105.0718248}
  end

  def reroute_unauth_user
    redirect_to root_path unless signed_in?
  end
end

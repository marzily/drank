class StaticPagesController < ApplicationController
  before_action :reroute_auth_user

  def landing_page

  end

  def reroute_auth_user
    redirect_to users_show_path if signed_in?
  end
end

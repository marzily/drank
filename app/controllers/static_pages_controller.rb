class StaticPagesController < ApplicationController
  before_action :reroute_auth_user

  def landing_page
  end

  private
  
    def reroute_auth_user
      redirect_to users_path if signed_in?
    end
end

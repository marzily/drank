class UsersController < ApplicationController
  before_action :reroute_unauth_user

  def show
    @temp = "this is the params temp: #{params['temp_f']}"
    @drinks = Weather.current_range(params["temp_f"]).drinks
    @recommended = @drinks.sample.drink_type
  end

  private

    def reroute_unauth_user
      redirect_to root_path unless signed_in?
    end
end

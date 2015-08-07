class LandingPagesController < ApplicationController
  def show
    # byebug
    # location = Location.new([params[:latitude], params[:longitude]])
    # session[:city] = location.city
    # session[:state] = location.state
    @current_conditions = Weather.current_conditions
  end
end

class MapsController < ApplicationController
  def coords
# byebug
    # location = Location.new([params[:latitude], params[:longitude]])
    # session[:city] = location.city
    # session[:state] = location.state
    redirect_to root_path
  end
end

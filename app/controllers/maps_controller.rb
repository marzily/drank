class MapsController < ApplicationController
  def coords
    location = Location.new([params[:latitude], params[:longitude]])
    session[:city] = location.city
    session[:state] = location.state
    redirect_to landing_page_path
  end
end

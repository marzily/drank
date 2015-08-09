class MapsController < ApplicationController
  def coords
    location = Location.new(latitude: [params[:latitude], longitude: params[:longitude]])
    session[:city] = location.city
    session[:state] = location.state
    redirect_to users_show_path
  end
end

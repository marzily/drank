class MapsController < ApplicationController
  def coords
    location = Location.new(latitude: params[:latitude], longitude: params[:longitude])
    session[:location] = { city: location.city,
                           state: location.state,
                           latitude: params[:latitude],
                           longitude: params[:longitude] }
    redirect_to users_show_path
  end
end

class InputsController < ApplicationController
  def coords
    location = Location.new(latitude: params[:latitude], longitude: params[:longitude])
    session[:location] = { city: location.city,
                           state: location.state,
                           latitude: params[:latitude],
                           longitude: params[:longitude] }
    redirect_to users_path
  end

  def drink_type
    session[:drink_type] = params[:drink_type]
    redirect_to users_path
  end
end

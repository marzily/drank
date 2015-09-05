class LocationsController < ApplicationController
  def coords
    session[:location] = { latitude:  params[:latitude],
                           longitude: params[:longitude] }
    redirect_to users_path
  end

  def city_state
    session[:location][:city]  = params[:city]
    session[:location][:state] = params[:state]
    redirect_to users_path
  end
end

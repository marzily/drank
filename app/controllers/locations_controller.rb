class LocationsController < ApplicationController
  def coords
    session[:location] = { latitude:  params[:latitude],
                           longitude: params[:longitude] }
    redirect_to users_path
  end

  def city_state
    session[:location]['city']  = params[:city]
    session[:location]['state'] = params[:state]
    redirect_to users_path
  end

  def drink_type
    session[:drink_type] = params[:drink_type]
    redirect_to users_path
  end
end

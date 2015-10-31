class LocationsController < ApplicationController
  def coords
    session[:location] = { latitude:  params[:latitude],
                           longitude: params[:longitude] }
    render nothing: true
  end

  def city_state
    session[:location][:city]  = params[:city]
    session[:location][:state] = params[:state]
    
    render nothing: true
  end
end

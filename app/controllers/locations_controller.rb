class LocationsController < ApplicationController
  def coords
    session[:location] = { latitude:  params[:latitude],
                           longitude: params[:longitude] }
    render nothing: true
  end
end

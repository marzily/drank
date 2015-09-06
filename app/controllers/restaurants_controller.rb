class RestaurantsController < ApplicationController
  def drink
    restaurants = search_client.businesses(params[:drink], session[:location]['latitude'], session[:location]['longitude'])

    render json: restaurants
  end

  def search_client
    @search_client ||= SearchAPI.new
  end
end

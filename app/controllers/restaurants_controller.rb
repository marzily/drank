class RestaurantsController < ApplicationController
  def drink
    @restaurants = search_client.businesses(session[:drink], session[:location]['latitude'], session[:location]['longitude'])

    render partial: "users/restaurants"
  end

  def search_client
    @search_client ||= SearchAPI.new
  end
end

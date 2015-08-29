class RestaurantsController < ApplicationController
  def drink
    session[:drink] = params[:drink]
    restaurants = search_client.businesses(session[:drink], session[:location]['latitude'], session[:location]['longitude'])

    render partial: "users/restaurants", locals: { restaurants: restaurants }
    # redirect_to users_path
  end

  def search_client
    @search_client ||= SearchAPI.new
  end
end

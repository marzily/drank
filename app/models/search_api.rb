require 'yelp'

class SearchAPI
  attr_reader :client

  def initialize
    @client = yelp_client
  end

  def yelp_client
    @client ||= Yelp::Client.new({ consumer_key: ENV['yelp_key'],
                                   consumer_secret: ENV['yelp_secret'],
                                   token: ENV['yelp_token'],
                                   token_secret: ENV['yelp_token_secret'] })
  end

  def response(drink_type, lat, lng)
    params = {term: drink_type, limit: 10, sort: 1}
    coordinates = {latitude: lat, longitude: lng}
    yelp_client.search_by_coordinates(coordinates, params)
  end

  def businesses(drink_type, lat, lng)
    response(drink_type, lat, lng).businesses.to_json
  end
end

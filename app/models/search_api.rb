require 'yelp'
# remove from db

class SearchAPI
  attr_reader :response

  def initialize(drink_type, lat, lng)
    @response = response(drink_type, lat, lng)
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

  def region
    response.region
  end

  def businesses
    response.businesses
  end
    # returns ['region', 'total', 'businesses']
    # .businesses
    # returns array of businesses
  # end
  # {latitude: 39.7514438, longitude: -105.0718248}

  # client.search_by_coordinates({latitude: 39.7514438, longitude: -105.0718248}, {mode: 0, term: 'slushies', limit: 10})


end

require 'yelp'

class SearchAPI < ActiveRecord::Base

  def self.yelp_client
    @client ||= Yelp::Client.new({ consumer_key: ENV['yelp_key'],
                                   consumer_secret: ENV['yelp_secret'],
                                   token: ENV['yelp_token'],
                                   token_secret: ENV['yelp_token_secret'] })
  end

  # def self.response
    # yelp_client.search_by_coordinates({lat, long}, params, locale)
    # returns ['region', 'total', 'businesses']
    # .businesses
    # returns array of businesses
  # end
  # {latitude: 39.7514438, longitude: -105.0718248}

  # client.search_by_coordinates({latitude: 39.7514438, longitude: -105.0718248}, {mode: 0, term: 'slushies', limit: 10})


end

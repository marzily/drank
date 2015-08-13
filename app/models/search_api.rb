require 'yelp'
# remove from db

class SearchAPI
  attr_reader :yelp_response

  def initialize(drink_type, lat, lng)
    @yelp_response = response(drink_type, lat, lng)
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

  def businesses
    yelp_response.businesses

    # keys =
    # ["is_claimed", "distance", "mobile_url", "rating_img_url", "review_count",
    # "name", "snippet_image_url", "rating", "url", "location", "phone", "snippet_text",
    # "image_url", "categories", "display_phone", "rating_img_url_large", "id",
    # "is_closed", "rating_img_url_small"]

    # name => "name"
    # categories => [[category, category]]
    # location => struct
        # .display_address ["1619 Reed St", "Denver, CO 80214"]
        # .coordinate.latitude
        # .coordinate.longitude
    # is_closed => boolean
    # review_count => int
    # display_phone => "phone num"
    # "rating_img_url_large" => image of stars
    # "rating_img_url"
    # url => yelp url
    # disance => float
  end
    # returns ['region', 'total', 'businesses']
    # .businesses
    # returns array of businesses
  # end
  # {latitude: 39.7514438, longitude: -105.0718248}


end

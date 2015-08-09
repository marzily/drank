require 'open-uri'
require 'json'

class Location
  attr_reader :response

  def initialize(coords = {})
    @response = json_response(coords)
  end

  def json_response(coords)
    unless coords.empty?
      location = open("http://maps.googleapis.com/maps/api/geocode/json?latlng=#{coords[:latitude]},#{coords[:longitude]}").read
      JSON.parse(location)
    end
  end

  def address_components
    response["results"].first["address_components"]
  end

  def neighborhood
    address_components[2]["long_name"]
  end

  def city
    address_components[3]["long_name"]
  end

  def state
    address_components[5]["short_name"]
  end
end

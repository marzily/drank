require 'open-uri'
require 'json'

class Location
  attr_reader :response

  def initialize(coords)
    @response = json_response(coords)
  end

  def json_response(coords)
    unless coords.nil?
      location = open("http://maps.googleapis.com/maps/api/geocode/json?latlng=#{coords.first},#{coords.last}").read
      # &key=#{ENV['google_key']}
      JSON.parse(location)
    end
  end

  def address_components
    @response["results"].first["address_components"]
  end

  def city
    address_components[2]["long_name"]
  end

  def state
    address_components[4]["short_name"]
  end
end

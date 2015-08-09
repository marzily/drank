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
    find_criteria('neighborhood', 'long_name')
  end

  def city
    find_criteria('locality', 'long_name')
  end

  def state
    find_criteria('administrative_area_level_1', 'short_name')
  end

  def find_criteria(type, name)
    address_components.select do |details|
      details['types'].include?(type)
    end.first[name]
  end
end

class Location
  attr_reader :response

  def initialize(coords)
    @response = json_response(coords)
  end

  def json_response(coords)
    location = open("http://maps.googleapis.com/maps/api/geocode/json?latlng=#{coords.first},#{coords.last}").read
    JSON.parse(location)
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

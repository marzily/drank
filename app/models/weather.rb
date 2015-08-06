require 'open-uri'
require 'json'

class Weather

  def current_conditions
    open("http://api.wunderground.com/api/#{API}/geolookup/conditions/q/IA/Cedar_Rapids.json") do |f|
      json_string = f.read
      parsed_json = JSON.parse(json_string)
      location = parsed_json['location']['city']
      temp_f = parsed_json['current_observation']['temp_f']
      print "Current temperature in #{location} is: #{temp_f}\n"
    end
  end

end

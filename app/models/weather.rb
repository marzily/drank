require 'open-uri'
require 'json'

class Weather


  def self.current_conditions(location=nil)
    temp_f = nil
    open("http://api.wunderground.com/api/#{ENV['weather_key']}/geolookup/conditions/q/CO/Denver.json") do |f|
      json_string = f.read
      parsed_json = JSON.parse(json_string)
      # location = parsed_json['location']['city']
      temp_f = parsed_json['current_observation']['temp_f']
      # print "Current temperature in #{location} is: #{temp_f}\n"
    end
    temp_f
  end

end

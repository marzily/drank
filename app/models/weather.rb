require 'open-uri'
require 'json'

class Weather
  def self.current_conditions(city, state)
    city.nil? || state.nil? ? nil : temperature(city, state)
  end

  def self.temperature(city, state)
    temp_f = nil
    open("http://api.wunderground.com/api/#{ENV['weather_key']}/geolookup/conditions/q/#{state}/#{city}.json") do |f|
      json_string = f.read
      parsed_json = JSON.parse(json_string)
      temp_f = parsed_json['current_observation']['temp_f']
    end
    temp_f
  end
end

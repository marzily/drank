require 'open-uri'
require 'json'

class Weather < ActiveRecord::Base
  validates :min_temp, presence: true, unless: ->(weather){weather.max_temp.present?}
  validates :max_temp, presence: true, unless: ->(weather){weather.min_temp.present?}
  validate  :temp_range

  has_many  :weather_drinks
  has_many  :drinks, through: :weather_drinks

  def temp_range
    if min_temp && max_temp && min_temp > max_temp
      errors.add(:max_temp, "min temp cannot be greater than max temp")
    end
  end

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

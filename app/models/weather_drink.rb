class WeatherDrink < ActiveRecord::Base
  belongs_to :weather
  belongs_to :drink
end

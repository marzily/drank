require 'byebug'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# weather ranges
cold = Weather.create(min_temp: nil, max_temp: 69)
mild = Weather.create(min_temp: 70, max_temp: 89)
hot = Weather.create(min_temp: 90, max_temp: nil)

# drinks
hot_drinks = [ "hot chocolate", "coffee", "tea", "latte", "mocha", "espresso",
               "hot apple cider", "steamed milk" ]

iced_drinks = [ "iced tea", "juice", "iced coffee", "iced espresso drinks",
                "soft drinks", "lemonade", "italian soda", "shakes", "soylent" ]

ice_blended_drinks = [ "smoothies", "ice blended drinks", "slushies" ]

def create_drinks(drink_types, weather)
  drink_types.map do |drink_type|
    weather.drinks.create(drink_type: drink_type)
  end
end

hot_drink_objects         = create_drinks(hot_drinks, cold)
iced_drink_objects        = create_drinks(iced_drinks, mild)
ice_blended_drink_objects = create_drinks(ice_blended_drinks, hot)

iced_drink_objects.each do |drink|
  WeatherDrink.create(drink_id: drink.id, weather_id: hot.id)
end

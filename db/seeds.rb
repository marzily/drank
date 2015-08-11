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

hot_drinks.each do |hot_drink|
  cold.drinks.create(drink_type: hot_drink)
end

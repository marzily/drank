# weather ranges
cold = Weather.create(min_temp: nil, max_temp: 65)
mild = Weather.create(min_temp: 66, max_temp: 89)
hot = Weather.create(min_temp: 90, max_temp: nil)

# drinks
hot_drinks = [ "hot chocolate", "coffee", "tea", "lattes", "mochas", "espresso",
               "hot apple cider", "steamed milk" ]

iced_drinks = [ "iced tea", "juice", "iced coffee", "iced espresso drinks",
                "soft drinks", "lemonade", "italian soda", "soylent" ]

ice_blended_drinks = [ "smoothies", "ice blended drinks", "slushies", "shakes" ]

def create_drinks(drink_types, weather)
  drink_types.map do |drink_type|
    weather.drinks.create(drink_type: drink_type)
  end
end

hot_drink_objects         = create_drinks(hot_drinks, cold)
iced_drink_objects        = create_drinks(iced_drinks, mild)
ice_blended_drink_objects = create_drinks(ice_blended_drinks, hot)

module UsersHelper
  def location
    session['location']
  end

  def current_conditions
    Weather.current_conditions(session['location']['city'], session['location']['state'])
  end

  def drink_recommendation
    weather_condition = Weather.current_range(current_conditions)
    weather_condition.drinks.sample.drink_type
  end
end

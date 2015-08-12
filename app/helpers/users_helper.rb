module UsersHelper
  def location
    session['location']
  end

  def current_conditions
    Weather.current_conditions(session['location']['city'], session['location']['state'])
  end

  def drink_types
    Weather.current_range(current_conditions).drinks.map(&:drink_type)
  end

  def drink_recommendation
    drink_types.sample
  end
end

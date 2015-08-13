module UsersHelper
  def location
    session['location']
  end

  def current_conditions
    Weather.current_conditions(location['city'], location['state'])
  end

  def drinks_by_temp
    @drinks ||= Weather.current_range(current_conditions).drinks
  end

  def drink_recommendation
    return session[:drink_type] unless session[:drink_type].nil?
    drink = drinks_by_temp.sample
    session[:drink_type] = drink.drink_type
  end

  def search_client
    @search_client ||= SearchAPI.new
  end
end

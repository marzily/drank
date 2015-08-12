module UsersHelper
  def location
    session['location']
  end

  def current_conditions
    Weather.current_conditions(session['location']['city'], session['location']['state'])
  end

  def drinks_by_temp
    @drinks ||= Weather.current_range(current_conditions).drinks
  end

  def drink_recommendation
    params[:drink_id].nil? ? drinks_by_temp.sample : Drink.find(params[:drink_id])
  end
end

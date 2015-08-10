module UsersHelper
  def location
    session['location']
  end

  def current_conditions
    Weather.current_conditions(session['location']['city'], session['location']['state'])
  end
end

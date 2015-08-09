module UsersHelper
  def weather_data
    { city: session[:city], state: session[:state], temperature: current_conditions }
  end

  def current_conditions
    Weather.current_conditions(session[:city], session[:state])
  end
end

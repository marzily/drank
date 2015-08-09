module UsersHelper
  def display_data
    { city: session[:city], state: session[:state], weather: current_conditions }
  end

  def current_conditions
    @weather = Weather.current_conditions(session[:city], session[:state])
  end
end

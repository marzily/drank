class WeatherController < ApplicationController

  def current_conditions
    session[:temp_f] = params[:temp_f]
    redirect_to users_path
  end

end

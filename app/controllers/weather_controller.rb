class WeatherController < ApplicationController
  def current_conditions
    session[:temp_f] = params[:temp_f]
    render nothing: true
  end
end

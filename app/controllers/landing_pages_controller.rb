class LandingPagesController < ApplicationController
  def show
    @current_conditions = Weather.current_conditions
  end
end

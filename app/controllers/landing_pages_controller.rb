class LandingPagesController < ApplicationController
  def show
  end

  def index

    @current_conditions = Weather.current_conditions
  end
end

class Api::V1::ForecastsController < ApplicationController

  def show
    # binding.pry
    weather = ForecastFacade.new(params[:location])
    #test :location params should be denver,co
    # weather.google_geocode_response
    binding.pry
  end

end

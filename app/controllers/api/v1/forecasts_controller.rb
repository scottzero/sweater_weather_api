class Api::V1::ForecastsController < ApplicationController

  def show
    weather_data = PresenterFacade.new(params[:location])
    weather_data.google_geocode
    weather_data.darksky
    render json: ForecastSerializer.new(weather_data.current_weather)
    # binding.pry
  end
end

class Api::V1::ForecastsController < ApplicationController

  def show
    weather_data = PresenterFacade.new(params[:location])
  end
end

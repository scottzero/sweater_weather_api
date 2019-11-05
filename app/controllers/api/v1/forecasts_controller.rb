class Api::V1::ForecastsController < ApplicationController
  def show
    serialize_forecast
  end
end

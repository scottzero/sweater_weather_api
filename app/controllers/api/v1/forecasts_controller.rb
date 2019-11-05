class Api::V1::ForecastsController < ApplicationController
  def show
    serialize_forecast #abstracted to app con
  end
end

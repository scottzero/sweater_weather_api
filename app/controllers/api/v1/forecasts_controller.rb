class Api::V1::ForecastsController < ApplicationController
  #http://localhost:3000/api/v1/forecast?location=denver,co
  def show
    render json: ForecastSerializer.new(PresenterFacade.new(params[:location]).google_geocode)
  end
end

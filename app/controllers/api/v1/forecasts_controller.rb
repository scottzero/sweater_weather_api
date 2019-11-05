class Api::V1::ForecastsController < ApplicationController

  def show
    render json: ForecastSerializer.new(PresenterFacade.new(params[:location]).google_geocode)
  end
end

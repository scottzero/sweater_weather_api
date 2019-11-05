class ApplicationController < ActionController::API
  def serialize_forecast
    render json: ForecastSerializer.new(PresenterFacade.new(params[:location]).google_geocode)
  end
end

class ApplicationController < ActionController::API
  def serialize_forecast
    render json: ForecastSerializer.new(PresenterFacade.new(params[:location]).google_geocode)
  end

  def serialize_background_img
    render json: BackgroundSerializer.new(PresenterFacade.new(params[:location]).get_img(params[:location]))
  end
end

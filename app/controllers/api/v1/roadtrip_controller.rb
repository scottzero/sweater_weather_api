class Api::V1::RoadTripController < ApplicationController
  def show
    # API key must be sent
    user = User.find_by(api_key: params[:api_key])
    if user == true
      render json: RoadtripSerializer.new(RoadtripFacade.new(params).roadtrip_data)
    else
      render json: {error: "Unauthorized, incorrect API key."}, status: 401
    end
    # If no API key or an incorrect key is provided return 401 (Unauthorized)
    # You will use the Google Directions API: https://developers.google.com/maps/documentation/directions/start in order to find out how long it will take to travel from the two locations, and then deliver the weather forecast for the hour of arrival. For example, Denver to Pueblo would take two hours. You will deliver a forecast two hours in the future that includes the temperature and summary, and estimated travel time.
    # The structure of the response is up to you, but should be JSON API 1.0 Compliant.
  end
end

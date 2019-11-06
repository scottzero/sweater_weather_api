class Api::V1::RoadtripController < ApplicationController
  def create
    # API key must be sent
    user = User.find_by(api_key: params[:api_key])
    render json: RoadtripSerializer.new(RoadtripFacade.new(params).roadtrip_data)
  end
end

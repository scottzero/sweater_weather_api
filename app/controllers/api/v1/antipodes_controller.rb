class Api::V1::AntipodesController < ApplicationController

  def show
    antipode_data = AntipodesFacade.new(params[:loc])
    serialize_me = antipode_data.get_forecast
    render json: AntipodesSerializer.new(serialize_me)
  end
end

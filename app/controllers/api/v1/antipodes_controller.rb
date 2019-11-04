class Api::V1::AntipodesController < ApplicationController

  def show
    antipode_data = AntipodesFacade.new(params[:location])
    serialize_me = antipode_data.get_forecast
    binding.pry
    render json: AntipodesSerializer.new(serialize_me)
  end
end

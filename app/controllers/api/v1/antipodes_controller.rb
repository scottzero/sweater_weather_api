class Api::V1::AntipodesController < ApplicationController

  def show
    antipode_data = AntipodesFacade.new(params[:loc])
    binding.pry
  end
end

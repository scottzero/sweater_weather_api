class Api::V1::BackgroundsController < ApplicationController

  def show
    background_data = PresenterFacade.new(params[:location])
    background_data.get_img(params[:location])
  end

end

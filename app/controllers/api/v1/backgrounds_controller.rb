class Api::V1::BackgroundsController < ApplicationController
  def show
    render json: BackgroundSerializer.new(PresenterFacade.new(params[:location]).get_img(params[:location]))
  end
end
#http://localhost:3000/api/v1/backgrounds?location=denver,co

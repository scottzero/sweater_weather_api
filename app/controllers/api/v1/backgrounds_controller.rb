class Api::V1::BackgoundsController < AppicationController

  def show
    background_data = PresenterFacade.new(params[:location])
    background_data.get_img(params[:location])
  end

end

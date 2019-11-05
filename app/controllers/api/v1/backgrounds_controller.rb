class Api::V1::BackgroundsController < ApplicationController
  def show
    serialize_background_img
  end
end

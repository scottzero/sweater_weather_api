class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params["email"])
    render json: {api_key: user.api_key}, status: 200
    #http://localhost:3000/api/v1/sessions?email=scp@gmail.com

  end


end

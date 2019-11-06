class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: {api_key: user.api_key}, status: 201
    else
      render json: {error: "email is not unique or password is not consistent"}, status: 404
    end
  end

  private
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end
#http://localhost:3000/api/v1/users?email=scp@gmail.com&password=hello&password_confirmation=hello

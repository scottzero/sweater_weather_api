class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: {api_key: user.api_key}, status: 201
      #http://localhost:3000/api/v1/users?email=scp@gmail.com&password=hello&password_confirmation=hello
      #test user creation, success!!
      #unique email works!! , tested in postman
    else
      render json: {error: "no user found"}, status: 404
      #working but need a user.
    end
  end

  private
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end

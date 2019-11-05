class UsersController < ApplicationController
  def create
    user = User.new(user_params)
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end

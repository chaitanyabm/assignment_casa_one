class Api::V1::SessionsController < ApplicationController
  def create
    user = User.where(email: params[:user][:email]).first
    if user and user.valid_password?(params[:user][:password])
      user.generate_authentication_token
      render json: {message: "Successfully loged in.", user: {authentication_token: user.auth_token}}
    else
      render status: :failed, json: { message: "Wrong user credentials."}
    end
  end

  def destroy_user
    user = User.find_by(auth_token: request.headers["Auth-Token"])
    if user
      user.generate_authentication_token
      render json: {message: "Successfully sign_out."}
    else
      render status: :failed, json: { message: "Something went wrong."}
    end
  end
end

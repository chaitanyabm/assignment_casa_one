class Api::V1::BaseController < ApplicationController
  def authenticate!
    token = request.headers["Auth-Token"]
    @user = User.find_by(auth_token: token)
    render status: :failed, json: { message: "401 Unauthorized."} unless token.present? && @user.present?
  end
end

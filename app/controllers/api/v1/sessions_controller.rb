class Api::V1::SessionsController < ApplicationController
  protect_from_forgery with: :null_session
  respond_to :json

  def create
    user = User.find_by(email: params[:email])
    password = params[:password]

    if user && user.valid_password?(params[:password])
      render json: {token: user.authentication_token}
    else
      head status: :unauthorized
    end
  end

end

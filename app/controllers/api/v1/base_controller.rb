class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session
  respond_to :json
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!

  private

  def authenticate_user_from_token!
    token = params[:authentication_token]
    user = token && User.find_by_authentication_token(token)
    if user && user.authentication_token == token
      sign_in user, store: false
    end
  end

end
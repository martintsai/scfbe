class HomeController < ApplicationController

  def index
    if user_signed_in?
      # redirect_to issues_path(current_user.issues)
      redirect_to issues_path
    end
  end

end

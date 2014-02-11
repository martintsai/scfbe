class HomeController < ApplicationController
 
  def index
    @issues = Issue.all.limit(3)
    if user_signed_in?
      redirect_to issues_path(current_user.issues)
    end 
  end

end

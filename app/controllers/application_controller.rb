class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # FIXME: figure out how to properly submit cross-site ajax POST
  # from mobile, must reenable this later !!!!

  # protect_from_forgery with: :exception
end

class ApplicationController < ActionController::Base
  # protect_from_forgery
  include SessionHelper

  def logged_in_user
    unless logged_in?
      flash[:danger] = 'Please Login'
      redirect_to login_path
    end
  end
end

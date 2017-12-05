class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  # helper_method :current_user
  #
  # def current_user
  #   puts "debuggggggg"
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #   puts @current_user
  # end

end

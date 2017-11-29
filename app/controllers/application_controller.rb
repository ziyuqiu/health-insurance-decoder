class ApplicationController < ActionController::Base
  puts "application controller"
  protect_from_forgery with: :exception
  include SessionsHelper

end

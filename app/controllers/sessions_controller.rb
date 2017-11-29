class SessionsController < ApplicationController

  def new
  end

  def create
    puts "-----------------"
    puts "session create"
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
    #user = User.find_by(email: params[:session][:email].downcase)
    # if user && user.authenticate(params[:session][:password])
    #   log_in user
    #   redirect_to user
    # else
    #   flash.now[:danger] = 'Invalid email/password combination'
    #   render 'new'
    # end
  end


  def destroy
    #log_out
    session[:user_id] = nil
    redirect_to root_url
  end
end

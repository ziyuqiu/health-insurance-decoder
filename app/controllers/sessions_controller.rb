class SessionsController < ApplicationController

  def new
  end

  def create

    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      respond_to do |format|
        format.html { redirect_to root_url, :flash => { :success => "You are logged in as "+current_user.name } }
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end

  end


  def destroy
    session[:user_id] = nil
    log_out
    redirect_to root_url
  end
end

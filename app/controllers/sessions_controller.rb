class SessionsController < ApplicationController
  $flag = 0
  def new
  end

  def create


    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      respond_to do |format|
        if $flag==0
          format.html { redirect_to root_url, :flash => { :success => "You are logged in as "+current_user.name } }
        else
          format.html { redirect_to '/logs', :flash => { :success => "You are logged in as "+current_user.name } }
        end
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

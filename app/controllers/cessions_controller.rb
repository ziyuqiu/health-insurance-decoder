class CessionsController < ApplicationController
  def create
    puts "--------------create"
    puts session
    user = User.from_omniauth(request.env["omniauth.auth"])
    cession[:user_id] = user.uid
    redirect_to root_path
  end

  def destroy
    cession[:user_id] = nil
    redirect_to root_path
  end
end

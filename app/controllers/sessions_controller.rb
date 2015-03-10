class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    flash[:notice] "Signed in!"
    redirect_to polls_path
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Signed out!"
    redirect_to root_path
  end

end
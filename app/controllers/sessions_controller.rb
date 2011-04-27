class SessionsController < ApplicationController

  def create
    begin
      @current_user = User.find_or_create_by_auth(request.env["omniauth.auth"])
      session[:user_id] = @current_user.id
    rescue Exception => e
      render :text => e.backtrace
    end
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "See ya!!!"
  end
end
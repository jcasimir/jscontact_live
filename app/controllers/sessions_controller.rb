class SessionsController < ApplicationController

  def create
    begin
      @user = User.find_or_create_by_auth(request.env["omniauth.auth"])
    rescue Exception => e
      render :text => e.backtrace
    end
    redirect_to root_url
  end
end
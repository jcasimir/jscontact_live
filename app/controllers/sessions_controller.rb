class SessionsController < ApplicationController

  def create
    #render :text => request.env["omniauth.auth"]["user_info"]["name"]
    @user = User.find_or_create_by_auth(request.env["omniauth.auth"])
  end
end
class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(oauth)

    session[:user_id] = user.id
    redirect_to users_show_path
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

    def oauth
      request.env["omniauth.auth"]
    end
end

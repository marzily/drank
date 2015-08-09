class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(oauth)

    if user
      session[:user_id] = user.id
      redirect_to users_show_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

    def oauth
      request.env["omniauth.auth"]
    end
end


# require 'yelp'
  #
  # def yelp_client
  #   @client ||= Yelp::Client.new({ consumer_key: ENV['yelp_key'],
  #                                  consumer_secret: ENV['yelp_secret'],
  #                                  token: ENV['yelp_token'],
  #                                  token_secret: ENV['yelp_token_secret']
  #                                })
  #                              end

require 'yelp'

class User < ActiveRecord::Base
  def yelp_client
    @client ||= Yelp::Client.new({ consumer_key: ENV['yelp_key'],
                                   consumer_secret: ENV['yelp_secret'],
                                   token: ENV['yelp_token'],
                                   token_secret: ENV['yelp_token_secret']
                                 })
  end

  def self.from_omniauth(auth_info)
    if user = find_by(uid: auth_info.extra.raw_info.user_id)
      user
    else
      create({name: auth_info.extra.raw_info.name,
              screen_name: auth_info.extra.raw_info.screen_name,
              uid: auth_info.extra.raw_info.user_id,
              oauth_token: auth_info.credentials.token,
              oauth_token_secret: auth_info.credentials.secret
              })
    end
  end

  def twitter_client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["twitter_key"]
      config.consumer_secret = ENV["twitter_secret"]
      config.access_token = oauth_token
      config.access_token_secret = oauth_token_secret
    end
  end

  def twitter_timeline
    twitter_client.home_timeline
  end

  def tweets
    twitter_timeline.map(&:text)
  end
end

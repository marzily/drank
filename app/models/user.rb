class User < ActiveRecord::Base
  def self.from_omniauth(auth_info)
    if user = find_by(uid: auth_info.uid)
      user
    else
      create({name: auth_info.info.name,
              screen_name: auth_info.info.nickname,
              uid: auth_info.uid,
              image_url: auth_info.info.image,
              oauth_token: auth_info.credentials.token,
              oauth_token_secret: auth_info.credentials.secret
              })
    end
  end
end

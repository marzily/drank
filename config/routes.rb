Rails.application.routes.draw do
  root 'landing_pages#index'

  # get 'auth/github', as: "login"
    # get 'oauth/callback', to: 'sessions#create'
    # @callback_url = "http://127.0.0.1:3000/oauth/callback"
end

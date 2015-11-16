Rails.application.routes.draw do
  root 'static_pages#landing_page'

  get 'auth/twitter', as: "login"
  get 'auth/twitter/callback', to: 'sessions#create'
  get '/logout', to: "sessions#destroy", as: "logout"

  resource :users, only: [:show]

  get '/coords', to: 'locations#coords'
  get '/drink', to: 'restaurants#drink'
end

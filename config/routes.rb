Rails.application.routes.draw do
  root 'static_pages#landing_page'

  get 'auth/twitter', as: "login"
  get 'auth/twitter/callback', to: 'sessions#create'
  get '/logout', to: "sessions#destroy", as: "logout"

  resource :users, only: [:show]

  post '/coords', to: 'locations#coords'
  post '/city_state', to: 'locations#city_state'
  # post '/drink_type', to: 'inputs#drink_type', as: :drink_type
  resources :possible_routes
end

Rails.application.routes.draw do
  root 'static_pages#landing_page'
  # resources :landing_pages, only: [:index]#, param: :location

  get 'auth/twitter', as: "login"
  get 'auth/twitter/callback', to: 'sessions#create'
  get '/logout', to: "sessions#destroy", as: "logout"

  get 'users/show'

  post '/coords', to: 'inputs#coords', as: :coords
end

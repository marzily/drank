Rails.application.routes.draw do
  root 'static_pages#landing_page'
  # resources :landing_pages, only: [:index]#, param: :location

  get 'auth/twitter', as: "login"
  get 'auth/twitter/callback', to: 'sessions#create'

  get '/logout', to: "sessions#destroy", as: "logout"

  resource :sessions, only: [:create, :destroy]

  post '/map', to: 'maps#coords', as: :map_coords
end

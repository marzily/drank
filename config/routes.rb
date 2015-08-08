Rails.application.routes.draw do
  root 'landing_pages#show'
  resources :landing_pages, only: [:index]#, param: :location
  # get 'oauth/callback', to: 'sessions#create'

  post '/map', to: 'maps#coords', as: :map_coords
end

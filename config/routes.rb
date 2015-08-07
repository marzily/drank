Rails.application.routes.draw do
  root 'landing_pages#show'
  resource :landing_page, only: [:show]#, param: :location
  # post '/landing_page', to: 'landing_pages#show'
  post '/map', to: 'maps#coords', as: :map_coords
end

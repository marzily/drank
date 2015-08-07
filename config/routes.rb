Rails.application.routes.draw do
  root 'landing_pages#show'
  resource :landing_page, only: [:show]#, param: :location

  post '/map', to: 'maps#coords', as: :coords
end

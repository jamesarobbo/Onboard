Onboard::Application.routes.draw do

  resources :rooms


# setting the homepage

  root "rooms#index"

 
end

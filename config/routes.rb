Onboard::Application.routes.draw do

  resources :rooms

  resources :users


# setting the homepage

  root "rooms#index"

 
end

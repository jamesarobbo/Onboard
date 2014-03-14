Onboard::Application.routes.draw do

  resources :rooms

  resources :users


# this is a singular resource because a user is only ever logged in once, not multiple times
  resource :session	

# setting the homepage

  root "rooms#index"

 
end

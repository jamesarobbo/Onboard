Onboard::Application.routes.draw do

  resources :rooms do
  # because orders are placed on rooms, orders is nested however only the new and create as they are specific to that room
    resources :orders, only: [:new, :create]

  end

# another section that is the list and single orders pages. i.e. the index and show pages

  resources :orders, only: [:index, :show]


  resources :users


# this is a singular resource because a user is only ever logged in once, not multiple times
  resource :session

# setting the homepage

  root "rooms#index"


end

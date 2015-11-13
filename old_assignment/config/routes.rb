Rails.application.routes.draw do

    root 'welcome#index'

  # get 'users/new'

  # get 'users/create'

  # get 'users/edit'

  # get 'users/udpate'

  # get 'users/index'

  # get 'users/show'

  # get 'users/destroy'

  # get 'sessions/new'

  get    'login'   => 'sessions#new'
  
  post   'login'   => 'sessions#create'

  get 'logout' => 'sessions#destroy'

  resources :users
  resources :cards
  resources :user_cards

  # You can have the root of your site routed with "root"



end

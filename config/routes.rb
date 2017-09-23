Rails.application.routes.draw do

  get 'login', to: "sessions#new"
  post '/login', to: "sessions#create"
  #get 'sessions/destroy'

  resources :users, only: [:new, :create]
  resources :chatrooms
  post '/messages', to: 'messages#create'

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
  
end

Rails.application.routes.draw do
  root 'users#create'
  
  get 'login', to: "sessions#new"
  post '/login', to: "sessions#create"
  #get 'sessions/destroy'
  get '/register', to: 'users#create'

  resources :users, only: [:new, :create]
  resources :chatrooms
  post '/messages', to: 'messages#create'

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

end

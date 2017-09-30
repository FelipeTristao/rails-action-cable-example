Rails.application.routes.draw do
  root 'sessions#new'

  get 'login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"
  get '/register', to: 'users#new'

  resources :users, only: [:new, :create]
  resources :chatrooms
  post '/messages', to: 'messages#create'

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

end

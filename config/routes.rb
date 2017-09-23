Rails.application.routes.draw do

  get 'login', to: "sessions#new"
  post '/login', to: "sessions#create"
  #get 'sessions/destroy'

  resources :users, only: [:new, :create]
  resources :chatrooms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

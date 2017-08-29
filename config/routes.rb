Rails.application.routes.draw do
  root 'trackers#index', as: :dashboard
  get "/login", to: 'sessions#new', as: :login
  post "/login", to: 'sessions#create'
  delete "/logout", to: 'sessions#destroy', as: :logout

  resources :users
  resources :trackers
end

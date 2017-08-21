Rails.application.routes.draw do
  get "/login", to: 'sessions#new', as: :login
  post "/login", to: 'sessions#create'
  delete "/logout", to: 'sessions#destroy', as: :logout
  get "/dashboard", to: 'trackers#index', as: :dashboard

  resources :users
end

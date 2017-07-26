Rails.application.routes.draw do
  root to: "users#index"
  resources :users
  resources :products

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get '/:category_name', to: 'categories#show'
end

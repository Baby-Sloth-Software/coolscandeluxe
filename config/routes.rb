Rails.application.routes.draw do
  root to: 'products#index'
  resources :products

  get "/datadump", to: "invupdates#index"
  post "/datadump", to: "invupdates#create"
  delete "/datadump", to: "invupdates#destroy"

  resources :orders, only: [:create]

  get 'text', to: 'texts#index'

end

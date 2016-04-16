Rails.application.routes.draw do
  root to: 'product#index'
  resources :product

  #get "/products", to: "products#inventory"


end

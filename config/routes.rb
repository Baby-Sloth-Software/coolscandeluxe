Rails.application.routes.draw do
  resources :products

  get "/products", to: "products#inventory"


end

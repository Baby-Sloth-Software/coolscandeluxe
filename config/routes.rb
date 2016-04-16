Rails.application.routes.draw do
  root to: 'product#index'
  resources :product

  
  #get "/product", to: product#index
  #post "/product", to: product#create
  #get "/product/new", to: product#new

end

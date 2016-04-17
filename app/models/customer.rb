class Customer < ActiveRecord::Base
  has_many :units
  has_many :orders
  
  enum conversation_state: [:start, :determine_product, :product_confirmed, :order_confirmed]
end

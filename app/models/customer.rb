class Customer < ActiveRecord::Base
  has_many :units

  enum conversation_state: [:determine_product, :product_confirmed, :order_confirmed]
end

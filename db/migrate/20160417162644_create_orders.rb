class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :product_id
      t.integer :quantity
      t.integer :state

      t.timestamps null: false
    end
  end
end

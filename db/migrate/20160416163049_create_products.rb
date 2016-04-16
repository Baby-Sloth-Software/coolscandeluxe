class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :quantity
      t.integer :rvalue
      t.integer :gvalue
      t.integer :bvalue

      t.timestamps null: false
    end
  end
end

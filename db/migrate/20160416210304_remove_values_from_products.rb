class RemoveValuesFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :rvalue, :integer
    remove_column :products, :gvalue, :integer
    remove_column :products, :bvalue, :integer
  end
end

class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.integer :customer_id
      t.string :identifier

      t.timestamps null: false
    end
  end
end

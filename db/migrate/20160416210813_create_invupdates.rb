class CreateInvupdates < ActiveRecord::Migration
  def change
    create_table :invupdates do |t|
      t.string :unit_id
      t.integer :c_value
      t.integer :r_value
      t.integer :g_value
      t.integer :b_value

      t.timestamps null: false
    end
  end
end

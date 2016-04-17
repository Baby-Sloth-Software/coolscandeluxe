class AddTextingStateToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :conversation_state, :integer
    add_column :customers, :conversation_id, :string
  end
end

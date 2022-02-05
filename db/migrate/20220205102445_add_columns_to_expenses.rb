class AddColumnsToExpenses < ActiveRecord::Migration[6.1]
  def change
    add_column :expenses, :checkout_session_id, :string
    add_column :expenses, :state, :string
  end
end

class ChangeColumnTypeFromBalanceSheet < ActiveRecord::Migration[6.1]
  def change
    change_column :balance_sheets, :balance, :float
  end
end

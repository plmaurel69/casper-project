class RemoveColumnsFromBalanceSheet < ActiveRecord::Migration[6.1]
  def change
    remove_column :balance_sheets, :type, :string
    remove_column :balance_sheets, :type_description, :string
    remove_column :balance_sheets, :paid, :boolean
    remove_column :balance_sheets, :payment_date, :date
    remove_column :balance_sheets, :amount, :integer
  end
end

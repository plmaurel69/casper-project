class CreateIncomes < ActiveRecord::Migration[6.1]
  def change
    create_table :incomes do |t|
      t.float :amount
      t.string :type
      t.boolean :paid
      t.date :payment_date
      t.references :balance_sheet, null: false, foreign_key: true

      t.timestamps
    end
  end
end

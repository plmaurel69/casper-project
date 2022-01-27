class CreateBalanceSheets < ActiveRecord::Migration[6.1]
  def change
    create_table :balance_sheets do |t|
      t.integer :amount
      t.string :type
      t.string :type_description
      t.boolean :paid
      t.date :payment_date
      t.integer :balance
      t.references :property_contract, null: false, foreign_key: true

      t.timestamps
    end
  end
end

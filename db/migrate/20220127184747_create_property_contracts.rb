class CreatePropertyContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :property_contracts do |t|
      t.date :end_date
      t.date :start_date
      t.date :scheduled_payment_date
      t.string :billing_frequency
      t.integer :rent_price
      t.string :rent_payment_status
      t.references :property, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

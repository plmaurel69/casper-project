class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :address
      t.string :rental_status
      t.integer :size
      t.string :property_name
      t.string :property_type
      t.integer :property_amount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

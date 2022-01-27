class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :profession, :string
    add_column :users, :professional_status, :string
    add_column :users, :birth_date, :date
    add_column :users, :user_type, :string
  end
end

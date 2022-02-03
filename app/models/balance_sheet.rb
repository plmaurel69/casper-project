class BalanceSheet < ApplicationRecord
  belongs_to :property_contract
  has_many :incomes
  has_many :expenses
  self.inheritance_column = :_type_disabled
end

class Expense < ApplicationRecord
  belongs_to :balance_sheet
  self.inheritance_column = :_type_disabled
end

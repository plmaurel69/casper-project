class BalanceSheet < ApplicationRecord
  belongs_to :property_contract
  self.inheritance_column = :_type_disabled


end

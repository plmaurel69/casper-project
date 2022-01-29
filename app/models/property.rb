class Property < ApplicationRecord
  belongs_to :user #as a owner
  has_many :property_contracts
  has_many :renters, through: :property_contracts, source: :user #as a renter
  has_many :balance_sheets, through: :property_contracts

  has_many :messages, through: :users
end

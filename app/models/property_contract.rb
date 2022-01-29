class PropertyContract < ApplicationRecord
  belongs_to :property
  belongs_to :user

  has_many :balance_sheets
  has_many :messages
end

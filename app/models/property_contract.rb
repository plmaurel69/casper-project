class PropertyContract < ApplicationRecord
  belongs_to :property

  has_many :balance_sheets
  has_many :messages

  belongs_to :user
  accepts_nested_attributes_for :user

end

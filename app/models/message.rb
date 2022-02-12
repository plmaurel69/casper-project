class Message < ApplicationRecord
  belongs_to :user
  belongs_to :property_contract
  belongs_to :property_contract
  has_one_attached :file
end

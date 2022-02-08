class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :messages
  has_many :properties #as an owner
  has_many :properties_as_a_renter, through: :property_contracts, source: :property #as a renter

  has_many :property_contracts


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

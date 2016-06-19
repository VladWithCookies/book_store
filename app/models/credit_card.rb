class CreditCard < ApplicationRecord
  belongs_to :user
  has_many :orders
  validates :number, :cvv, :expiration_month, :expiration_year, :lastname, :firstname, presence: true 
end

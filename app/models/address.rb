class Address < ApplicationRecord
  belongs_to :user
  validates  :firstname, :lastname, :street, :zipcode, :city, :phone, :country, presence: true
  validates :phone, numericality: true, length: { minimum: 10, maximum: 15 }
  validates :zipcode, format: { with: /\A\d{5}-\d{4}|\A\d{5}\z/ }
end

class Address < ApplicationRecord
  validates :address, :zipcode, :city, :phone, :country, presence: true
end

class Address < ApplicationRecord
  belongs_to :user
  validates :address, :zipcode, :city, :phone, :country, presence: true
end

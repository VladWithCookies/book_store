class Address < ApplicationRecord
  belongs_to :user
  validates :street, :zipcode, :city, :phone, :country, presence: true
end

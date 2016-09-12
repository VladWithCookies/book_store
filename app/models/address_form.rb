class AddressForm < Reform::Form
  property :firstname
  property :lastname
  property :street
  property :city
  property :country
  property :zipcode
  property :phone

  validates :firstname, :lastname, :street, :city, :country, :zipcode, :phone, presence: true
  validates :phone, numericality: true
  validates :zipcode, numericality: true
end
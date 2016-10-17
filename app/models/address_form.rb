class AddressForm < Reform::Form
  property :firstname
  property :lastname
  property :street
  property :city
  property :country
  property :zipcode
  property :phone

  validates :firstname, :lastname, :street, :city, :country, :zipcode, :phone, presence: true
  validates :phone, numericality: true, length: { minimum: 10, maximum: 15 }
  validates :zipcode, format: { with: /\A\d{5}-\d{4}|\A\d{5}\z/ }
end
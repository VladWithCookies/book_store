class CreditCardForm < Reform::Form
  property :cvv
  property :expiration_year
  property :expiration_month
  property :number
  property :user_id
  validates :user_id, :number, :cvv, :expiration_year, :expiration_month, presence: true
end
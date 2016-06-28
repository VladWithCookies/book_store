class OrderItem < ApplicationRecord
  belongs_to :book
  belongs_to :order
  #validates :price, :quantity, presence: true

  after_update :update_price
  after_create :update_price

  def update_price
    total = book.price * quantity
    update_columns(price: total)
  end

end

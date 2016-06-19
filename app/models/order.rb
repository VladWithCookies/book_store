class Order < ApplicationRecord
  belongs_to :user
  belongs_to :credit_card
  belongs_to :billing_address, class_name: 'Address'
  belongs_to :shipping_address, class_name: 'Address'
  has_many :order_items

  validates :total_price, :completed_date, :state, presence: true

  def add(book, quantity)
    order_items.create(book_id: book.id, quantity: quantity, price: book.price)
  end

  def get_total_price
    order_items.inject(0) { |sum, item| sum + item.quantity * item.price }
  end
end

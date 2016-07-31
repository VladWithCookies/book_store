class OrderItem < ApplicationRecord
  belongs_to :book
  belongs_to :order
  
  validates :price, :quantity, presence: true

  after_commit :update_price

  scope :from_order, -> (id) { where(order_id: id) }

  def update_price
    total = book.price * quantity
    update_columns(price: total)
    total
  end

  def self.most_popular(n)
    OrderItem.select('book_id')
             .group(:book_id)
             .order('sum(order_items.quantity) DESC').last(n)
  end
  
end

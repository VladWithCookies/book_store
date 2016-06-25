class Order < ApplicationRecord
  belongs_to :user
  belongs_to :credit_card
  belongs_to :billing_address, class_name: 'Address'
  belongs_to :shipping_address, class_name: 'Address'
  has_many :order_items

  #validates :total_price, :state, presence: true

  after_initialize :init
  after_update :get_item_total
  after_update :get_order_total

  def init 
    self.shipping ||= 5
    self.state ||= 'in progress'  
  end

  def add_item(book_id, quantity)
    book = Book.find(book_id)
    order_item = order_items.find_by(book_id: book_id)
    if order_item
      order_item.quantity += quantity
      order_item.save
    else
      order_items.create(price: book.price, quantity: quantity, book: book)

    end
    get_item_total
  end

  def get_item_total
    total = order_items.inject(0) { |sum, item| sum + item.price }
    update_columns(item_total: total)
  end

  def get_order_total
    update_columns(order_total: item_total + shipping)
  end
end

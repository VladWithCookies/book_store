  class Order < ApplicationRecord
  include AASM

  belongs_to :user
  belongs_to :credit_card
  belongs_to :billing_address, class_name: 'Address'
  belongs_to :shipping_address, class_name: 'Address'
  has_many :coupons
  has_many :order_items

  validates :state, presence: true

  after_initialize :init
  after_update :get_item_total
  after_update :get_order_total

  aasm column: :state, whiny_transitions: false do
    state :in_progress, initial: true
    state :in_queue
    state :in_delivery
    state :delivered

    event :place_order do
      transitions from: :in_progress, to: :in_queue
    end
  end

  def init 
    self.shipping ||= 5
    self.discount ||= 0
  end

  def add_coupon(code)
    coupon = Coupon.find_by(code: code)
    if coupon && !coupon.expired?
      self.discount += coupon.discount
      self.save
      coupon.delete
    end
  end

  def add_item(book_id, quantity)
    book = Book.find_by(id: book_id)
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
    total = order_items.inject(0) { |sum, item| sum + item.price } - discount
    update_columns(item_total: total)
    total
  end

  def get_order_total
    total = item_total + shipping
    update_columns(order_total: total)
    total
  end
    
end

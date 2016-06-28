class Book < ApplicationRecord
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :authors
  has_many :ratings
  has_many :order_items

  validates :title, :price, :in_stock, presence: true

  def self.most_popular(n)
    OrderItem.select('book_id')
             .group(:book_id)
             .order('sum(order_items.quantity) DESC').last(n)
  end
end

class Book < ApplicationRecord
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :authors
  has_many :ratings

  validates :title, :price, :in_stock, presence: true
end

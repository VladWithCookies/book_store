class Book < ApplicationRecord
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :authors
  has_many :ratings
  has_many :order_items

  mount_uploader :image, ImageUploader

  validates :title, :price, :in_stock, presence: true

  scope :books_by_category, -> (category_title) { includes(:categories).where("categories.title" => category_title)
                                                                       .references(:categories) }                                                                    
end

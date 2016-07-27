class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :text, :rating, presence: true

  def self.book_ratings(id)
    where(book_id: id)
  end
end

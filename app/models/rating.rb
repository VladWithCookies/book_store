class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :title, :text, :rating, presence: true
end

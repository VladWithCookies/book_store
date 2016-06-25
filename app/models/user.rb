class User < ApplicationRecord
  has_many :orders
  has_many :ratings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def create_order(**args)
    orders.create(args)
  end

  def orders_in_progress
    orders.where(state: 'in progress')
  end
end

class PagesController < ApplicationController
  def home
    @items = OrderItem.most_popular(3)
    @order_item = OrderItem.new
  end
end
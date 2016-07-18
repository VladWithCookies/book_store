class OrdersController < ApplicationController
  def index
    @order = current_order
    @orders_processing = Order.where(user: current_user, state: 'processing')
    @orders_delivery = Order.where(user: current_user, state: 'delivery')
    @orders_delivered = Order.where(user: current_user, state: 'delivered')
  end

  def show
    @order = Order.find_by(id: params[:id])
  end
end
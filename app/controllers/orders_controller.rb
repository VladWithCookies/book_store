class OrdersController < ApplicationController
  def index
    @order = current_order
    @orders_processing = Order.which_is('in_queue')
    @orders_delivery = Order.which_is('in_delivery')
    @orders_delivered = Order.which_is('delivered')
  end

  def show
    @order = Order.find_by(id: params[:id])
  end
end
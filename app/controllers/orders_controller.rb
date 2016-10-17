class OrdersController < ApplicationController
  load_and_authorize_resource
  
  def index
    @order = current_order
    @orders_processing = current_user.orders.in_queue
    @orders_delivery = current_user.orders.in_delivery
    @orders_delivered = current_user.orders.delivered
  end

  def show
    @order = Order.find_by(id: params[:id])
  end
end
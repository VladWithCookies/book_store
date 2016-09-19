class OrdersController < ApplicationController
  load_and_authorize_resource
  
  def index
    @order = current_order
    @orders_processing = Order.which('in_queue', current_user)
    @orders_delivery = Order.which('in_delivery', current_user)
    @orders_delivered = Order.which('delivered', current_user)
  end

  def show
    @order = Order.find_by(id: params[:id])
  end
end
class OrderItemsController < ApplicationController
  def index
    @order = current_order
    @order_items = @order.order_items.all
  end

  def create 
    @order = current_order    
    @order.add_item(params[:order_item][:book_id], params[:order_item][:quantity].to_i)
    redirect_to cart_path
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.delete
    current_order.get_item_total
    redirect_to cart_path
  end

  def empty_cart
    OrderItem.where(order_id: current_order.id).delete_all
    current_order.get_item_total
    redirect_to cart_path
  end
end
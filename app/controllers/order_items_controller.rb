class OrderItemsController < ApplicationController
  before_filter :get_order, only: [:index, :create, :update_all]

  def index
    @order_items = @order.order_items
    @coupon = Coupon.new
  end

  def create   
    @order.add_item(params[:order_item][:book_id], params[:order_item][:quantity].to_i)
    redirect_to cart_path
  end

  def destroy
    @order_item = OrderItem.find_by(id: params[:id])
    @order_item.delete
    current_order.get_item_total
    redirect_to cart_path
  end

  def empty_cart
    OrderItem.from_order(current_order.id).delete_all
    current_order.get_item_total
    redirect_to cart_path
  end

  def update_all
    params[:quantity].each do |item_id, quantity|
      @order.order_items.find_by_id(item_id).update(:quantity => quantity)
    end
    add_coupon unless params[:coupon_code].blank?
    current_order.get_item_total
    redirect_to order_items_path
  end

  def add_coupon
    current_order.add_coupon(params[:coupon_code])
  end

  private 
    def get_order
      @order = current_order
    end
end

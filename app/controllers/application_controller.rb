class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order 
    if session[:order_id].nil?
      @current_order = Order.create(user_id: current_user.id)
      session[:order_id] = @current_order.id
    else
      @current_order = Order.find(session[:order_id])
    end
    @current_order
  end

end

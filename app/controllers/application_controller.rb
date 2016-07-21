class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order
  add_flash_types :success, :warning, :danger, :info

  def current_order 
    @current_order = Order.find_by(id: session[:order_id])
    set_current_order
  end

  def set_current_order
    if @current_order.nil?
      @current_order = Order.create(user: current_user)
      session[:order_id] = @current_order.id
    elsif current_user && @current_order.user.nil?
      @current_order.update(user: current_user)
    end
    @current_order
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_path
  end
  
end

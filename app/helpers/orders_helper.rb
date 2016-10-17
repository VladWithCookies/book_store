module OrdersHelper
  def shipping_method(order) 
    case order.shipping
      when 5
        "UPS Ground"
      when 10
        "UPS Two Day"
      when 15
        "Ups One Day"
    end
  end
end
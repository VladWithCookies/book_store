class CheckoutsController < ApplicationController
  def address
    @billing_address = Address.new
    @countries = Country.pluck(:name)
  end

  def address_confirm
    @billing_address = Address.create(address_params)
    current_order.update(billing_address: @billing_address)
    current_order.update(shipping_address: @billing_address) #!!!
    redirect_to "/checkout/delivery"
  end

  def delivery
  end

  def delivery_confirm 
    current_order.update(shipping: params[:shipping_price])
    redirect_to "/checkout/payment"
  end

  def payment
    @credit_card = CreditCard.new
  end

  def payment_confirm
    @credit_card = CreditCard.create(credit_card_params)
    current_order.update(credit_card: @credit_card)
    redirect_to "/checkout/confirm"
  end

  def confirm
    @order = current_order
    @billing_address = @order.billing_address
    @shipping_address = @order.shipping_address
    @credit_card = @order.credit_card
  end

  def complete
    @order = current_order
    @billing_address = @order.billing_address
    @shipping_address = @order.shipping_address
    @credit_card = @order.credit_card

    @order.update(state: 'processing')
    session[:order_id] = nil
  end

  private 
    def address_params
      params.require(:address).permit(:firstname, :lastname, :address, :city, :country, :zipcode, :phone)
    end

    def credit_card_params 
      params.require(:credit_card).permit(:number, :cvv, :expiration_year, :expiration_month, :user_id)
    end
end

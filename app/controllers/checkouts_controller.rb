class CheckoutsController < ApplicationController
  load_and_authorize_resource
  before_filter :check_address, only: [:payment, :confirm]
  before_filter :check_card, only: [:confirm]

  def address
    @countries = Country.pluck(:name)
    @address_form = AddressForm.new(Address.new)
  end

  def address_confirm
    @billing_address = Address.create(address_params)
    @address_form = AddressForm.new(Address.new)

    if params[:use_billing]
      current_order.update(billing_address: @billing_address, shipping_address: @billing_address)
    else
      current_order.update(billing_address: @billing_address, shipping_address: current_user.shipping_address)
    end

    if @address_form.validate(address_params)
      redirect_to "/checkout/delivery" 
    else
      redirect_to "/checkout/address", danger: "All fields are required!"
    end
  end

  def delivery_confirm
    current_order.update(shipping: params[:shipping_price])
    redirect_to "/checkout/payment"
  end

  def payment
    @credit_card_form = CreditCardForm.new(CreditCard.new)
  end

  def payment_confirm
    @credit_card_form = CreditCardForm.new(CreditCard.new)
    @credit_card = CreditCard.create(credit_card_params)
    current_order.update(credit_card: @credit_card)

    if @credit_card_form.validate(credit_card_params)
      redirect_to "/checkout/confirm"
    else
      redirect_to "/checkout/payment", danger: "All fields is required!"
    end
  end

  def confirm
    @order = current_order
    @billing_address = @order.billing_address.decorate
    @shipping_address = @order.shipping_address.decorate
    @credit_card =  @order.credit_card.decorate
  end

  def complete
    @order = current_order
    @billing_address = @order.billing_address.decorate
    @shipping_address = @order.shipping_address.decorate
    @credit_card = @order.credit_card.decorate

    @order.place_order!
    session[:order_id] = nil
  end

  private 
    def address_params
      params.require(:address).permit(:firstname, :lastname, :street, :city, :country, :zipcode, :phone)
    end

    def credit_card_params 
      params.require(:credit_card).permit(:number, :cvv, :expiration_year, :expiration_month, :user_id)
    end

    def check_address
      redirect_to '/checkout/address' unless current_order.billing_address && current_order.shipping_address 
    end

    def check_card 
      redirect_to '/checkout/payment' unless current_order.credit_card
    end
end

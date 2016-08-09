class CheckoutsController < ApplicationController
  load_and_authorize_resource
  before_filter :check_address, only: [:payment, :confirm]
  before_filter :check_card, only: [:confirm]
  before_filter :set_order

  def address
    redirect_to cart_path, danger: t('notices.cart_empty') if @order.order_items.empty?   
    @countries = Country.pluck(:name)
    @address_form = AddressForm.new(Address.new)
  end

  def address_confirm
    @billing_address = Address.create(billing_address_params)
    @shipping_address = Address.create(shipping_address_params)

    if params[:use_billing]
      @order.update(billing_address: @billing_address, shipping_address: @billing_address)
    else
      @order.update(billing_address: @billing_address, shipping_address: @shipping_address)
    end

    if forms_valid?
      redirect_to checkout_delivery_path 
    else
      redirect_to checkout_address_path, danger: t('notices.fields_required')
    end
  end

  def delivery_confirm
    @order.update(shipping: params[:shipping_price])
    redirect_to checkout_payment_path
  end

  def payment
    @credit_card_form = CreditCardForm.new(CreditCard.new)
  end

  def payment_confirm
    @credit_card_form = CreditCardForm.new(CreditCard.new)
    @credit_card = CreditCard.create(credit_card_params)
    @order.update(credit_card: @credit_card)

    if @credit_card_form.validate(credit_card_params)
      redirect_to checkout_confirm_path
    else
      redirect_to checkout_payment_path, danger: t('notices.fields_required')
    end
  end

  def confirm
    @billing_address = @order.billing_address.decorate
    @shipping_address = @order.shipping_address.decorate
    @credit_card =  @order.credit_card.decorate
  end

  def complete
    @billing_address = @order.billing_address.decorate
    @shipping_address = @order.shipping_address.decorate
    @credit_card = @order.credit_card.decorate
    @order.place_order!
    session[:order_id] = nil
  end

  private 
    def set_order
      @order = current_order
    end

    def billing_address_params
      params.require(:billing_address).permit(:firstname, :lastname, :street, :city, :country, :zipcode, :phone)
    end

    def shipping_address_params
      params.require(:shipping_address).permit(:firstname, :lastname, :street, :city, :country, :zipcode, :phone)
    end

    def credit_card_params 
      params.require(:credit_card).permit(:number, :cvv, :expiration_year, :expiration_month, :user_id)
    end

    def check_address
      redirect_to checkout_address_path unless current_order.billing_address && current_order.shipping_address 
    end

    def check_card 
      redirect_to checkout_payment_path unless current_order.credit_card
    end

    def forms_valid? 
      @address_form = AddressForm.new(Address.new)
      @address_form.validate(billing_address_params) && @address_form.validate(shipping_address_params)
    end
end

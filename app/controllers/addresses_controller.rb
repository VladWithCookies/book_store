class AddressesController < ApplicationController
  before_action :set_user

  def edit
    @address_form = AddressForm.new(Address.new)
    @countries = Country.pluck(:name)
  end

  def update_billing
    if @user.billing_address
      @user.billing_address.update(address_params)
    else 
      @user.update(billing_address: create_address)
    end

    show_notice(@user.billing_address, t('notices.billing_update'))
    redirect_to edit_address_path(@user)
  end

  def update_shipping
    if @user.shipping_address
      @user.shipping_address.update(address_params)
    else 
      @user.update(shipping_address: create_address)
    end

    show_notice(@user.shipping_address, t('notices.shipping_update'))
    redirect_to edit_address_path(@user)
  end

  private 
    def show_notice(form, success_message)
      if form.valid?
        flash[:notice] = success_message
      else 
        flash[:error] = form.errors.full_messages.join(', ')
      end
    end

    def address_params
      params.require(:address).permit(:firstname, :lastname, :street, :city, :country, :zipcode, :phone)
    end

    def set_user
      @user = current_user
    end

    def create_address
      Address.create(address_params)
    end
end
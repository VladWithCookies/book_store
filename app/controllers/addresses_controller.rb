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

    if @user.billing_address.valid?
      flash[:notice] = "Billing address was successfully updated!"
    else
      flash[:error] = "All fields are required!"
    end
    redirect_to edit_address_path(@user)
  end

  def update_shipping
    if @user.shipping_address
      @user.shipping_address.update(address_params)
    else 
      @user.update(shipping_address: create_address)
    end

    if @user.shipping_address.valid?
      flash[:notice] = "Shipping address was successfully updated!"
    else 
      flash[:error] = "All fields are required!"
    end
    redirect_to edit_address_path(@user)
  end

  private 
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
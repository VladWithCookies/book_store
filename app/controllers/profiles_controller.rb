class ProfilesController < ApplicationController
  before_action :set_user

  def edit
    @billing_address = Address.new
    @shipping_address = Address.new
    @countries = Country.pluck(:name)
  end

  def update
    @user.update(user_params)
  end

  def update_password
    @user.update_with_password(user_params)
    sign_in @user, bypass: true
  end

  def update_billing
    if @user.billing_address
      @user.billing_address.update(address_params)
    else 
      @user.update(billing_address: create_address)
    end
  end

  def update_shipping
    if @user.shipping_address
      @user.shipping_address.update(address_params)
    else 
      @user.update(shipping_address: create_address)
    end
  end

  private 
    def user_params
      params.require(:user).permit(:email, :password,  :current_password)
    end

    def address_params
      params.require(:address).permit(:firstname, :lastname, :address, :city, :country, :zipcode, :phone)
    end

    def set_user
      @user = current_user
    end

    def create_address
      Address.create(address_params)
    end
end

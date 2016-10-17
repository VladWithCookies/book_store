class ProfilesController < ApplicationController
  before_action :set_user

  def update
    current_user.update(user_params)
    flash[:notice] = t('notices.email_update')
    redirect_to edit_address_path  
  end

  def update_password
    current_user.update_with_password(user_params)
    sign_in current_user, bypass: true
    flash[:notice] = t('notices.password_update')
    redirect_to edit_address_path
  end

  private 
    def user_params
      params.require(:user).permit(:email, :password,  :current_password)
    end

end

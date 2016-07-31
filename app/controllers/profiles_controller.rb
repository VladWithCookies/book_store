class ProfilesController < ApplicationController
  before_action :set_user

  def update
    @user.update(user_params)
  end

  def update_password
    @user.update_with_password(user_params)
    sign_in @user, bypass: true
    flash[:notice] = "Password was successfully updated!"
    redirect_to edit_profile_path
  end

  private 
    def user_params
      params.require(:user).permit(:email, :password,  :current_password)
    end

    def set_user
      @user = current_user
    end

end

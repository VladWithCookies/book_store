class User < ApplicationRecord
  has_many :orders
  has_many :ratings

  belongs_to :billing_address, class_name: 'Address'
  belongs_to :shipping_address, class_name: 'Address'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, 
         omniauth_providers: [:facebook]

  def admin?
    role == "admin"
  end
  
  def self.from_omniauth(auth)
    auth_params = {
      provider: auth.provider,
      uid: auth.uid,
      email: auth.info.email
    }

    user = find_by_email(auth_params[:email])

    if user.present?
      return nil unless user.save_facebook_data(auth_params)
      user
    else
      auth_params[:password] = Devise.friendly_token[0, 20]
      User.create(auth_params)
    end
  end

end

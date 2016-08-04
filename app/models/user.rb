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
    
  def is_facebook_account
    self[:provider].present? && self[:uid].present?
  end

  def check_facebook(provider, uid)
    self[:provider] == provider && self[:uid] == uid
  end

  def save_facebook_data(params)
    return update(params) unless is_facebook_account
    return true if check_facebook(params[:provider], params[:uid])
    errors.add(:base, "#{params[:email]} is attach for another account")
    false
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

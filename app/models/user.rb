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
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email    = auth.info.email
      user.provider = auth.provider 
      user.uid      = auth.uid
      user.save
    end
  end

end

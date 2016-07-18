class Coupon < ApplicationRecord
  belongs_to :order
  
  def expired?
    Date.current < starts_at || Date.current > expires_at
  end
end

class Coupon < ApplicationRecord
  belongs_to :order
  
  def is_valid?
    Date.current < starts_at || Date.current > expires_at || used
  end
end

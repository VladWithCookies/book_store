class CreditCardDecorator < Draper::Decorator
  delegate_all
  
  def cvv_hidden
    "** ** ** #{object.cvv.last(4)}"
  end

  def expiration_date
    "#{object.expiration_month}/#{object.expiration_year}"
  end

end

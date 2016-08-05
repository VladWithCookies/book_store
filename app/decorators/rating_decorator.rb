class RatingDecorator < Draper::Decorator
  delegate_all
  
  def rate
    object.rating
  end

  def formated_date 
    object.created_at.strftime("%d %b. %Y")
  end

end
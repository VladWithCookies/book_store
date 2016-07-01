class BookDecorator < Draper::Decorator
  delegate_all

  def authors_full_names
    object.authors.map { |a| "#{a.firtsname}", "#{a.lastname}")}.join(", ")
  end
end

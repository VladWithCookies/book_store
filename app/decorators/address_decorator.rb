class AddressDecorator < Draper::Decorator
  delegate_all

  def full_name
    "#{object.firstname} #{object.lastname}"
  end
end

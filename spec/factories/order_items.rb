FactoryGirl.define do
  factory :order_item do
    price 8
    quantity 2
    book
    order
  end
end
FactoryGirl.define do
  factory :order do
    order_total 50 
    shipping  5
    item_total 45
    completed_date FFaker::Time.date 
    state 'in progress'
    user
    credit_card
    association :billing_address, factory: :address
    association :shipping_address, factory: :address
  end
end
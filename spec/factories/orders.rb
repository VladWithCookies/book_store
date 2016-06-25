FactoryGirl.define do
  factory :order do
    total_price 49.99 
    completed_date FFaker::Time.date 
    state 'in progress'
    user
    credit_card
    association :billing_address, factory: :address
    association :shipping_address, factory: :address
  end
end
FactoryGirl.define do
  factory :order do
    order_total 50 
    shipping  5
    item_total 45
    completed_date FFaker::Time.date 
    state 'in_progress'
    discount 0
    user
    credit_card
  end
end
FactoryGirl.define do
  factory :coupon do
    sequence(:code) { |n| "coupon#{n}"}
  end
end

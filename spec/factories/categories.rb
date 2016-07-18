FactoryGirl.define do
  factory :category do
    sequence(:title) { |n| "title#{n}"}
  end
end
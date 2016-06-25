FactoryGirl.define do
  factory :category do
    title FFaker::Product.product
  end
end
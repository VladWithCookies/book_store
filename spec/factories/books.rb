FactoryGirl.define do   
  factory :book do
    title       FFaker::Product.product_name
    description FFaker::Lorem.paragraph
    price 15
    in_stock 42   
  end  
end

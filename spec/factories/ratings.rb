FactoryGirl.define do
  factory :rating do
    text   FFaker::Lorem.paragraph
    rating 5
    book
    user
  end
end
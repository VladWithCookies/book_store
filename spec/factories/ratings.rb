FactoryGirl.define do
  factory :rating do
    title  FFaker::Lorem.phrase
    text   FFaker::Lorem.paragraph
    rating 5
    book 
    user
  end
end
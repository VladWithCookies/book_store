FactoryGirl.define do
  factory :credit_card do
    firstname        FFaker::Name.first_name 
    lastname         FFaker::Name.last_name 
    cvv              FFaker::String.from_regexp("^[0-9]{3, 4}$")
    expiration_month FFaker::Time.date
    expiration_year  2016
    number           12345678910
    user
  end
end
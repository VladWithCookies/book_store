FactoryGirl.define do 
  factory :address do
    address FFaker::Address.street_address 
    zipcode FFaker::AddressUS.zip_code 
    city    FFaker::Address.city 
    phone   FFaker::PhoneNumber.phone_number 
    country FFaker::Address.country
  end
end


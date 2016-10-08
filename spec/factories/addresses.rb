FactoryGirl.define do 
  factory :address do
    firstname FFaker::Name.first_name
    lastname  FFaker::Name.last_name
    street  FFaker::Address.street_address 
    zipcode FFaker::AddressUS.zip_code 
    city    FFaker::Address.city 
    phone   "12345678910"
    country FFaker::Address.country
  end
end


require 'rails_helper'

describe CreditCard do 
  subject { FactoryGirl.create(:credit_card) }

  context "validations" do
    [:number, :cvv, :expiration_month, :expiration_year, :firstname, :lastname].each do |field|
      it "is invalid without #{field}" do
        is_expected.to validate_presence_of(field)
      end
    end
  end

  context "associations" do
    it "has many orders" do 
      should have_many(:orders)
    end

    it "belongs to customer" do
      should belong_to(:user)
    end
  end
end
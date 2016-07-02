require 'rails_helper'

describe CreditCard do 
  subject { FactoryGirl.create(:credit_card) }

  context "associations" do
    it "has many orders" do 
      should have_many(:orders)
    end

    it "belongs to user" do
      should belong_to(:user)
    end
  end

  context "validations" do 
    [:number, :cvv, :expiration_month, :expiration_year].each do |field|
      it "invalid without #{field}" do
        is_expected.to validate_presence_of(field)
      end
    end
  end
end
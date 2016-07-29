require 'rails_helper'

describe OrderItem do 
  subject { FactoryGirl.create(:order_item) }

  context "validations" do
    [:price, :quantity].each do |field|
      it "is invalid without #{field}" do
        is_expected.to validate_presence_of(field)
      end
    end
  end

  context "associations" do
    [:book, :order].each do |x|
      it "belongs to #{x}" do
        should belong_to(x)
      end
    end
  end

  context ".update_price" do
    it "update price of order_item" do  
      expect(subject.update_price).to eq(30)
    end
  end
end
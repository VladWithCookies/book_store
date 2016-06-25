require 'rails_helper'

describe Order do 
  subject { FactoryGirl.create(:order) }
  let(:book) { FactoryGirl.create(:book) }

  context "validations" do
    [:total_price, :completed_date, :state].each do |field|
      it "is invalid without #{field}" do
        is_expected.to validate_presence_of(field)
      end
    end
  end

  context "associations" do
    it "has many order items" do 
      should have_many(:order_items)
    end

    [:user, :credit_card, :billing_address, :shipping_address].each do |x|
      it "belongs to #{x}" do
        should belong_to(x)
      end
    end
  end

  context "#add" do
    it "adds new book to order items" do
      expect { subject.add(book, 1) }.to change(subject.order_items, :count).by(1)
    end
  end

  context "#total_price" do
    it "return total price of order" do
      FactoryGirl.create_list(:order_item, 4, order: subject)
      expect(subject.get_total_price).to eq(10)
    end
  end
end
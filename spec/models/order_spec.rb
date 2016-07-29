require 'rails_helper'

describe Order do 
  subject { FactoryGirl.create(:order) }
  let(:book) { FactoryGirl.create(:book) }

  context "validations" do
    [:state].each do |field|
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

  context ".add_item" do
    it "add new order_item  to order" do
      subject.add_item(book.id, 1)
      expect(subject.order_items.count).to eq(1)
    end
  end

  context ".get_item_total" do 
    it "calculate and update price of order" do
      FactoryGirl.create_list(:order_item, 4, order: subject)
      expect(subject.get_item_total).to eq(120)
    end
  end

  context ".get_order_total" do 
    it "calculate and update price of order include delivery" do
      expect(subject.get_order_total).to eq(50)
    end
  end
  
end
require 'rails_helper'

RSpec.describe User, type: :model do

  context "associations" do
    [:billing_address, :shipping_address].each do |x|
      it "belongs to #{x}" do
        should belong_to(x)
      end
    end

    [:orders, :ratings].each do |x|
      it "have many #{x}" do
        should have_many(x)
      end
    end
  end
  
end


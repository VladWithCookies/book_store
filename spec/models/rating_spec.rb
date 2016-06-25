require 'rails_helper'

describe Rating do 
  subject { FactoryGirl.create(:rating) }

  context "associations" do
    [:user  , :book].each do |x|
      it "belongs to #{x}" do
        should belong_to(x)
      end
    end
  end
end
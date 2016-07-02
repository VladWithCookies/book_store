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

  context "validations" do 
    [:title, :text, :rating].each do |field|
      it "invalid without #{field}" do
        is_expected.to validate_presence_of(field)
      end
    end
  end
end
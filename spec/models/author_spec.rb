require 'rails_helper'

describe Author do 
  subject { FactoryGirl.create(:author) }

  context "validations" do
    [:firstname, :lastname].each do |field|
      it "is invalid without #{field}" do
        is_expected.to validate_presence_of(field)
      end
    end
  end

  context "associations" do
    it "has and belongs to many books" do 
      should have_and_belong_to_many(:books)
    end
  end
end
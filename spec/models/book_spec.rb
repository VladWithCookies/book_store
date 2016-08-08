require 'rails_helper'

describe Book do 
  subject { FactoryGirl.create(:book)}

  context "validations" do
    [:title, :price, :in_stock].each do |field|
      it "is invalid without #{field}" do
        is_expected.to validate_presence_of(field)
      end
    end
  end

  context "associations" do
    [:ratings, :order_items].each do |entity|
      it "has many #{entity}" do 
        should have_many(entity)
      end
    end

    it "has and belongs to many authors" do 
      should have_and_belong_to_many(:authors)
    end

    it "has and belongs to many categories" do 
      should have_and_belong_to_many(:categories)
    end
  end
end
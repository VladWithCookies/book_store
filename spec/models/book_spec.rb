require 'rails_helper'

describe Book do 
  subject { FactoryGirl.create(:book) }

  context "validations" do
    [:title, :price, :in_stock].each do |field|
      it "is invalid without #{field}" do
        is_expected.to validate_presence_of(field)
      end
    end
  end

  context "associations" do
    it "has many order ratings" do 
      should have_many(:ratings)
    end

    it "has and belongs to many authors" do 
      should have_and_belong_to_many(:books).join_table('authors_books')
    end

    it "has and belongs to many categories" do 
      should have_and_belong_to_many(:books).join_table('books_categories')
    end
  end

end
require 'rails_helper'

RSpec.describe RatingsController, :type => :controller do
  let!(:book) { FactoryGirl.create(:book) }

  sign_in_user

  describe "POST #create" do

    context "valid attributes" do
      it "saves new review to db" do
        expect {
          post :create, params: { rating: { book_id: 1, title: "test", text: "test", user_id: 1, rating: 4} }
        }.to change(Rating, :count).by(1)
      end

      it 'redirect to book show path' do 
        post :create, params: { rating: { book_id: 1, title: "test", text: "test", user_id: 1, rating: 4} }
        expect(response).to redirect_to(book_path(book))
      end
    end

    context "invalid attributes" do
      it "not saves new review to db" do
        expect {
          post :create, params: { rating: { book_id: 1, title: "", text: "", user_id: 1, rating: 4} }
        }.to change(Rating, :count).by(0)
      end

      it 'redirect to book show add rating path' do 
        post :create, params: { rating: { book_id: 1, title: "", text: "", user_id: 1, rating: 4} }
        expect(response).to redirect_to(add_rating_book_path(book))
      end
    end

  end
end
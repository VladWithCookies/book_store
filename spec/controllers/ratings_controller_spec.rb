require 'rails_helper'

RSpec.describe RatingsController, :type => :controller do
  let!(:book) { FactoryGirl.create(:book) }

  sign_in_user

  describe "POST #create" do

    context "valid attributes" do
      it "saves new review to db" do
        expect {
          post :create, params: { rating: { book_id: book.id, text: "test", user_id: 1, rating: 4}, locale: :en }
        }.to change(Rating, :count).by(1)
      end

      it 'redirect to book show path' do 
        post :create, params: { rating: { book_id: book.id, text: "test", user_id: 1, rating: 4}, locale: :en }
        expect(response).to redirect_to(book_path(book))
      end
    end

    context "invalid attributes" do
      it "not saves new review to db" do
        expect {
          post :create, params: { rating: { book_id: book.id, text: "", user_id: 1, rating: 4}, locale: :en }
        }.to change(Rating, :count).by(0)
      end

      it 'redirect to new rating path' do 
        post :create, params: { rating: { book_id: book.id, text: "", user_id: 1, rating: 4}, locale: :en }
        expect(response).to redirect_to(new_book_rating_path(book))
      end
    end

  end

  describe 'GET #new' do
    before { get :new, params: { locale: :en, book_id: 1 } }

    it 'assigns @rating' do
      expect(assigns(:rating)).not_to be_nil
    end

    it 'render new view' do
      expect(response).to render_template :new
    end
  end

end

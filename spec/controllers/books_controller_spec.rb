require 'rails_helper'

RSpec.describe BooksController, :type => :controller do
  let(:books) { FactoryGirl.create_list(:book, 3) }
  let(:book) { books.first }

  let(:categories) { FactoryGirl.create_list(:category, 3)}
  let(:ratings) { FactoryGirl.create_list(:rating, 3)}

  sign_in_user

  describe 'GET #index' do 
    before { get :index, { locale: :en } }

    it "return list of books" do 
      expect(assigns(:books)).to match_array(books)
    end

    it "return list of categories" do 
      expect(assigns(:categories)).to match_array(categories)
    end

    it "render index view" do 
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: book.id, locale: :en } }

    it 'assigns @book' do
      expect(assigns(:book)).not_to be_nil
    end

    it 'assigns @order_item' do
      expect(assigns(:order_item)).not_to be_nil
    end

    it "render show view" do 
       expect(response).to render_template :show
    end
  end

end
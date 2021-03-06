require 'rails_helper'

RSpec.describe OrderItemsController, :type => :controller do
  let!(:order_item) { FactoryGirl.create(:order_item) }
  let!(:book) { FactoryGirl.create(:book) }

  describe "GET #index" do
    before { get :index, { locale: :en } }

    it "assigns @order" do
      expect(assigns(:order)).not_to be_nil
    end

    it "return list of order_items" do
      expect(assigns(:order_items)).not_to be_nil
    end

    it "assigns @coupon" do 
      expect(assigns(:coupon)).to be_a_new(Coupon)
    end

    it "render index view" do
      expect(response).to render_template :index
    end
  end

  describe "DELETE #destroy" do
    it "destroy order item" do
      expect do
        delete :destroy, params: { id: order_item.id, locale: :en }
      end.to change(OrderItem, :count).by(-1)
    end

    it 'redirect to cart_path' do
      delete :destroy, params: { id: order_item.id, locale: :en }
      expect(response).to redirect_to(cart_path)
    end
  end

  describe "POST #create" do
    it "add new order item to db" do
      expect {
        post :create, params: { order_item: { book_id: book, quantity: 1}, locale: :en }
      }.to change(OrderItem, :count).by(1)
    end

    it 'redirect to cart_path' do
      post :create, params: { order_item: { book_id: book, quantity: 1}, locale: :en }
      expect(response).to redirect_to(cart_path)
    end
  end

end

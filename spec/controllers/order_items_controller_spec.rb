require 'rails_helper'

RSpec.describe OrderItemsController, :type => :controller do
  let!(:order_item) { FactoryGirl.create(:order_item) }

  describe "GET #index" do
    before { get :index }

    it "assigns @order" do
      expect(assigns(:order)).not_to be_nil
    end

    it "return list of order_items" do
      expect(assigns(:order_items)).not_to be_nil
    end

    it "assigns @coupon" do 
      expect(assigns(:coupon)).to be_a_new(Coupon)
    end
  end

  describe "DELETE #destroy" do
    it "destroy order item" do
      expect do
        delete :destroy, params: { id: order_item.id }
      end.to change(OrderItem, :count).by(-1)
    end

    it 'redirect to cart_path' do
      delete :destroy, params: { id: order_item.id }
      expect(response).to redirect_to(cart_path)
    end
  end

end

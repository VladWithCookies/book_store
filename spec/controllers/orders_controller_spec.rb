require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do
  let(:order) { FactoryGirl.create(:order) }

  describe "GET #index" do 
    before { get :index }
    
    it "assigns @order" do 
      expect(assigns(:order)).not_to be_nil
    end

    it "assigns @orders_processing" do 
      expect(assigns(:orders_processing)).not_to be_nil
    end

    it "assigns @orders_delivery" do 
      expect(assigns(:orders_delivery)).not_to be_nil
    end

    it "assigns @orders_delivered " do 
      expect(assigns(:orders_delivered )).not_to be_nil
    end

    it "render index view" do 
       expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    before { get :show, params: { id: order.id } }

    it "assigns @order" do 
      expect(assigns(:order)).not_to be_nil
    end

    it "render show view" do 
       expect(response).to render_template :show
    end
  end
end

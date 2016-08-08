require 'rails_helper'

RSpec.describe CheckoutsController, :type => :controller do
  let!(:address) { FactoryGirl.create(:address) }
  let!(:credit_card) { FactoryGirl.create(:credit_card) }
  let!(:order) { FactoryGirl.create(:order)}
  sign_in_user

  describe "GET #address" do
    before { get :address, { locale: :en } }

    it "render address view" do
      expect(response).to render_template :address
    end
  end

  describe "GET #delivery" do
    before { get :delivery, { locale: :en } }

    it "render delivery view" do
      expect(response).to render_template :delivery
    end
  end

  describe "POST #address_confirm" do 
    it "save address to db" do
      expect {
        post :address_confirm, params: { address: attributes_for(:address), locale: :en }
      }.to change(Address, :count).by(1)
    end
  end

  describe "POST #payment_confirm" do 
    it "save credit card to db" do
      expect {
        post :payment_confirm, params: { credit_card: attributes_for(:credit_card), locale: :en }
      }.to change(CreditCard, :count).by(1)
    end
  end

end

require 'rails_helper'

RSpec.describe CheckoutsController, :type => :controller do
  let!(:address) { FactoryGirl.create(:address) }
  let!(:credit_card) { FactoryGirl.create(:credit_card) }
  sign_in_user

  describe "POST #address_confirm" do 
    it "save address to db" do
      expect {
        post :address_confirm, params: { address: attributes_for(:address) }
      }.to change(Address, :count).by(1)
    end
  end

  describe "POST #payment_confirm" do 
    it "save credit card to db" do
      expect {
        post :payment_confirm, params: { credit_card: attributes_for(:credit_card) }
      }.to change(CreditCard, :count).by(1)
    end
  end

end

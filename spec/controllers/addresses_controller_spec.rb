require 'rails_helper'

RSpec.describe AddressesController, :type => :controller do
  let!(:user) { FactoryGirl.create(:user) }
  sign_in_user

  describe "GET #edit" do
    before { get :edit, params: { id: user.id, locale: :en }}

    it "assigns @address_form" do 
      expect(assigns(:address_form)).not_to be_nil
    end

    it "render edit template" do
      expect(response).to render_template(:edit)
    end
  end
end

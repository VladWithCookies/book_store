require 'rails_helper'

RSpec.describe ProfilesController, :type => :controller do
  let!(:user) { FactoryGirl.create(:user) }
  sign_in_user

  describe "GET #edit" do
    before { get :edit, params: { id: user.id }}

    it "assigns @address_form" do 
      expect(assigns(:address_form)).not_to be_nil
    end

    it "render edit template" do
      expect(response).to render_template(:edit)
    end
  end
end

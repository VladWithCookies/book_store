require 'rails_helper'

RSpec.describe CheckoutsController, :type => :controller do
  let(:countries) { FactoryGirl.create_list(:country, 3) }

  describe "GET #address" do
    before { get :address }

    it "render address view" do
      expect(response).to render_template :address
    end
  end

end

require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do
  let(:categories) { FactoryGirl.create_list(:category, 3)}
  let(:category) { categories.first }

  let(:book) { FactoryGirl.create(:book, categories: [category])}

  describe 'GET #category' do
    before { get :category, params: { category: category.title } }

    it "assigns @books" do 
      expect(assigns(:books)).to match_array([book])
    end

    it "assigns @categories" do 
      expect(assigns(:categories)).to match_array(categories)
    end

    it "render index template" do 
      expect(response).to render_template :index
    end
  end 
end

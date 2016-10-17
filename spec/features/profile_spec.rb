require 'rails_helper'
require 'capybara/rspec'

feature 'profile' do
  given!(:user) { FactoryGirl.create(:user) }
  given!(:country) { FactoryGirl.create(:country) }
  
  background do  
    sign_in user
  end

  scenario 'user change his address' do
    visit(edit_address_path(user))
    fill_in_address(country)
    click_on('SAVE', match: :first)
    expect(page).to have_content("address was successfully updated!")
  end

  scenario 'user change his address to invalid' do
    visit(edit_address_path(user))
    click_on('SAVE', match: :first)
    expect(page).to have_content("can't be blank")
  end
end

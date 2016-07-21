require 'rails_helper'
require 'capybara/rspec'

feature 'sign in' do
  given!(:user) { FactoryGirl.create(:user) }

  scenario 'existing user want to sign in' do
    sign_in(user)
    expect(page).to have_content('Logout')
  end

  scenario 'non-existing user want to sign in' do 
    visit new_user_session_path
    fill_in 'Email', with: 'fake@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'

    expect(page).to have_current_path(new_user_session_path)
  end

  scenario 'user logout' do 
    sign_in(user)

    click_on('Logout')
    expect(page).to have_content('Login')
  end

end
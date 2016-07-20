require 'rails_helper'
require 'capybara/rspec'

feature 'sign up' do
  given!(:user) { FactoryGirl.create(:user) }

  scenario 'user try to sign up' do
    visit(root_path)
    click_on('Sign up')

    within('#new_user') do
      fill_in('Email', with: 'test_user@test.com')
      fill_in('Password', with: '12345678')
      fill_in('Password confirmation', with: '12345678')

      click_on('Sign up')
    end

    expect(page).to have_content('Logout')
  end

  context 'with omniauth' do
    background do
      OmniAuth.config.test_mode = true
      visit(root_path)
    end

    scenario 'user try to sign up via facebook' do
      mock_auth_hash

      click_on('Sign up')
      click_on('Sign in with Facebook')
      expect(page).to have_content('Logout')
    end
  end
end
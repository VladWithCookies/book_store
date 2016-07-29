require 'rails_helper'
require 'capybara/rspec'

feature 'checkout' do 
  given!(:user) { FactoryGirl.create(:user) }
  given!(:book) { FactoryGirl.create(:book) }
  given!(:country) { FactoryGirl.create(:country) }
  given!(:credit_card) { FactoryGirl.create(:credit_card) }

  scenario 'user can fill billing and shipping address' do
    sign_in user
    add_to_cart(book)
    click_on('CHECKOUT')

    fill_in_address(country)
    click_on('SAVE AND CONTINUE')
    expect(page).to have_current_path('/checkout/delivery')
  end

  scenario 'user can fill credit card info' do
    sign_in user
    add_to_cart(book)
    click_on('CHECKOUT')

    fill_in_address(country)
    click_on('SAVE AND CONTINUE')
    click_on('SAVE AND CONTINUE')

    fill_in_credit_card(credit_card)
    click_on('SAVE AND CONTINUE')

    expect(page).to have_current_path('/checkout/confirm')
  end
end
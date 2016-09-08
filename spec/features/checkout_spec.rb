require 'rails_helper'
require 'capybara/rspec'

feature 'checkout' do 
  given!(:user) { FactoryGirl.create(:user) }
  given!(:book) { FactoryGirl.create(:book) }
  given!(:country) { FactoryGirl.create(:country) }
  given!(:credit_card) { FactoryGirl.create(:credit_card) }

  background do  
    sign_in user
    add_to_cart(book)
    click_on('CHECKOUT')
  end

  scenario 'user fill billing and shipping address' do
    fill_in_address(country)
    click_on('SAVE')
    expect(page).to have_current_path('/en/checkout/delivery')
  end

  scenario 'user fill invalid billing and shipping address' do
    click_on('SAVE')
    expect(page).to have_content("can't be blank")
  end

  scenario 'user fill credit card info' do
    fill_in_address(country)
    click_on('SAVE')
    click_on('SAVE AND CONTINUE')

    fill_in_credit_card(credit_card)
    click_on('SAVE AND CONTINUE')

    expect(page).to have_current_path('/en/checkout/confirm')
  end

  scenario 'user fill invalid credit card info' do
    fill_in_address(country)
    click_on('SAVE')
    click_on('SAVE AND CONTINUE')

    click_on('SAVE AND CONTINUE')

    expect(page).to have_content("can't be blank")
  end

  scenario 'user choose shipment method' do 
    fill_in_address(country)
    click_on('SAVE')
    click_on('SAVE AND CONTINUE')

    expect(page).to have_current_path('/en/checkout/payment')
  end

  scenario 'user confirm checkout' do
    fill_in_address(country)
    click_on('SAVE')
    click_on('SAVE AND CONTINUE')

    fill_in_credit_card(credit_card)
    click_on('SAVE AND CONTINUE')

    expect(page).to have_current_path('/en/checkout/confirm')
  end

  scenario 'user place order' do 
    fill_in_address(country)
    click_on('SAVE')
    click_on('SAVE AND CONTINUE')
    fill_in_credit_card(credit_card)
    click_on('SAVE AND CONTINUE')

    click_on('PLACE ORDER')

    expect(page).to have_current_path('/en/checkout/complete')
  end
end
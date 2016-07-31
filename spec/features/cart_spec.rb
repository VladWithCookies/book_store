require 'rails_helper'
require 'capybara/rspec'

feature 'cart' do 
  given!(:book) { create(:book) }
  given!(:user) { create(:user) }

  background do
    visit(book_path(book))
    click_on('ADD TO CART')
  end

  scenario 'user can remove book from cart' do
    click_on('Remove')
    expect(page).to_not have_content(book.title)
  end 

  scenario 'registered user can make checkout' do
    sign_in user
    visit(cart_path)
    click_on('CHECKOUT')
    expect(page).to have_current_path('/checkout/address')
  end
  
  scenario 'guess user cant make checkout' do
    click_on('CHECKOUT')
    expect(page).to have_current_path(new_user_session_path)
  end
end
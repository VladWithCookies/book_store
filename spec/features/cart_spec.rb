require 'rails_helper'
require 'capybara/rspec'

feature 'cart' do 
  given!(:book) { create(:book) }

  background do
    visit(book_path(book))
    click_on('ADD TO CART')
  end

  scenario 'user can remove book from cart' do
    click_on('Remove')
    expect(page).to_not have_content(book.title)
  end
end
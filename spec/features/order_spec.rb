require 'rails_helper'
require 'capybara/rspec'

feature 'order' do
  given!(:book) { FactoryGirl.create(:book) }

  scenario 'user can check info about recent order' do
    visit(book_path(book))
    click_on('ADD TO CART')

    visit(orders_path)
    expect(page).to have_content(book.title)
    expect(page).to have_content(book.price)
  end
end
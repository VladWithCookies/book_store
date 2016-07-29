require 'rails_helper'
require 'capybara/rspec'

feature 'book' do
  given!(:book) { FactoryGirl.create(:book) }
  given!(:user) { FactoryGirl.create(:user) }

  scenario 'user can see datailed info about book' do 
    visit(book_path(book))

    expect(page).to have_content(book.title)
    expect(page).to have_content(book.price)
    expect(page).to have_content(book.description)
  end

  scenario 'user can put books in shopping cart' do
    visit(book_path(book))
    click_on('ADD TO CART')

    expect(page).to have_current_path(cart_path)
    expect(page).to have_content(book.title)
  end

  scenario 'authenticated user can add review' do   
    sign_in(user)
    visit(book_path(book))

    click_on('Add review for this book')

    fill_in('Review title', with: 'Nice')
    fill_in('Review text', with: 'Nice')
    click_on('Create Rating')

    expect(page).not_to have_content('Nice')
  end

end
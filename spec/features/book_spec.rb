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

  describe 'user add review' do 

    scenario 'user create valid review' do   
      sign_in(user)
      visit(book_path(book))

      click_on('Add review for this book')

      fill_in('Review text', with: 'Nice')
      click_on('Create Rating')

      expect(page).to have_current_path(book_path(book))
      expect(page).to have_content "Review created"
    end

    scenario 'user create invalid review' do  
      sign_in(user)
      visit(book_path(book))

      click_on('Add review for this book')

      fill_in('Review text', with: '')
      click_on('Create Rating')

      expect(page).to have_current_path(add_rating_book_path(book))
      expect(page).to have_content "Invalid review"
    end
    
  end

  scenario 'non authenticated user cant add review' do   
    visit(book_path(book))
    click_on('Add review for this book')
    expect(page).to have_current_path("/users/sign_in?locale=en")
  end

  scenario 'user visit home page' do
    visit(root_path)
    add_to_cart(book)
    expect(page).to have_content(book.title)
  end
end
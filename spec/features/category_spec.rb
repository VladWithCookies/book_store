require 'rails_helper'
require 'capybara/rspec'

feature 'category' do 
  given!(:fantasy) { FactoryGirl.create(:category, title: 'Fantasy') }
  given!(:history) { FactoryGirl.create(:category, title: 'History') }
  given!(:book) { create(:book, categories: [fantasy]) }

  scenario 'user can see list of categories' do
    visit(books_path)

    expect(page).to have_content("Fantasy")
    expect(page).to have_content("History")
  end

  scenario 'user can navigate by categories' do 
    visit(books_path)
    click_on('Fantasy')
    expect(page).to have_content(book.title)
  end

end
module AcceptenceHelper
  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
  end

   def fill_in_address(country)
    fill_in "Firstname", with: FFaker::Name.first_name, match: :prefer_exact
    fill_in "Lastname", with: FFaker::Name.last_name, match: :prefer_exact
    fill_in "Street address", with: FFaker::Address.street_address, match: :prefer_exact 
    fill_in "City", with: FFaker::Address.city, match: :prefer_exact
    fill_in "Zip", with: '12345', match: :prefer_exact
    fill_in "Phone", with: '1234567891', match: :prefer_exact
    select country.name, match: :prefer_exact
  end

  def fill_in_credit_card(card)
    fill_in "Card number", with: card.number
    fill_in "Card code", with: card.cvv
    select Date::MONTHNAMES.last
    select Time.now.year
  end

  def fill_in_invalid_address
    fill_in "Zip", with: '123', match: :prefer_exact
    fill_in "Phone", with: '123', match: :prefer_exact 
  end

  def add_to_cart(book)
    visit(book_path(book))
    click_on('ADD TO CART')
  end
end
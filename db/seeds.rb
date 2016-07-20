User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', role: 'admin')
User.create!(email: 'user@example.com', password: 'password', password_confirmation: 'password')

Book.create!(title: 'The Color of Magic', image: 'http://ecx.images-amazon.com/images/I/91Z8IVdGlAL._SL1500_.jpg', price: 10, in_stock: 40)

OrderItem.create!(price: 9, quantity: 1, book_id: 1)

Country.create!(name: 'New Zealand')
Country.create!(name: 'United Kingdom')
Country.create!(name: 'United States')

Category.create!(title: 'Fantasy')
Category.create!(title: 'Scince Fiction')
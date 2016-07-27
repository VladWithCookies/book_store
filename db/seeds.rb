User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', role: 'admin')
User.create!(email: 'user@example.com', password: 'password', password_confirmation: 'password')

Book.create!(title: 'The Color of Magic', price: 10, in_stock: 40) 
Book.create!(title: 'The Light Fantastic', price: 10, in_stock: 40)  
Book.create!(title: 'Wyrd Sisters', price: 10, in_stock: 40)  

Book.create!(title: 'Stranger', price: 10, in_stock: 40)
Book.create!(title: 'Volunteers of Eternity', price: 10, in_stock: 40)
Book.create!(title: 'Simple magic things', price: 10, in_stock: 40)
Book.create!(title: 'A Talkative Dead', price: 10, in_stock: 40)    
Book.create!(title: 'Lord of the Marmore', price: 10, in_stock: 40)    
Book.create!(title: 'Crow on the bridge', price: 10, in_stock: 40)    

Book.create!(title: 'Utopia', price: 10, in_stock: 40)

Author.create!(firstname: 'Terry', lastname: 'Pratchett')
Author.create!(firstname: 'Max', lastname: 'Frei')
Author.create!(firstname: 'Thomas', lastname: 'More')

OrderItem.create!(price: 9, quantity: 1, book_id: 1)
OrderItem.create!(price: 9, quantity: 1, book_id: 2)
OrderItem.create!(price: 9, quantity: 1, book_id: 3)

Country.create!(name: 'New Zealand')
Country.create!(name: 'United Kingdom')
Country.create!(name: 'United States')

Category.create!(title: 'Fantasy')
Category.create!(title: 'Fiction')
Category.create!(title: 'Historical')
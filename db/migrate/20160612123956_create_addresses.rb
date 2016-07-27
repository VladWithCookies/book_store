class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :firstname
      t.string :lastname
      t.string :street  
      t.string :zipcode
      t.string :city
      t.string :phone
      t.string :country
      t.timestamps
    end
  end
end

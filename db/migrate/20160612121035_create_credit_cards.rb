class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.integer :number
      t.string :cvv
      t.date :expiration_month
      t.date :expiration_year
      t.string :firstname
      t.string :lastname
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end

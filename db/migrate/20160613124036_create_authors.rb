class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :firstname
      t.string :lastname
      t.text :description
      t.timestamps
    end
  end
end
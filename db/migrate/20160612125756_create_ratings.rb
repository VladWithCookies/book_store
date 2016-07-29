class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.text :text
      t.integer :rating
      t.boolean :approval,  default: false
      t.belongs_to :user, index: true
      t.belongs_to :book, index: true
      t.timestamps
    end
  end
end

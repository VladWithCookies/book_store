class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.decimal :price
      t.integer :quantity
      t.belongs_to :book, index: true
      t.belongs_to :order, index: true
      t.timestamps
    end
  end
end

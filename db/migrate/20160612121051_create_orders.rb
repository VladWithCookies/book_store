class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.decimal :order_total
      t.decimal :shipping
      t.decimal :item_total
      t.decimal :discount
      t.date :completed_date
      t.string :state
      t.belongs_to :user, index: true
      t.belongs_to :credit_card, index: true
      t.belongs_to :billing_address, index: true
      t.belongs_to :shipping_address, index: true
      t.timestamps
    end
  end
end

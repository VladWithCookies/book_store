class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.string :code
      t.date :expires_at
      t.date :starts_at
      t.decimal :discount, default: 0
      t.boolean :used, default: false
      t.belongs_to :order, index: true
      t.timestamps
    end
  end
end

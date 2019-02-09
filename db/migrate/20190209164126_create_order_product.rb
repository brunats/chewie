class CreateOrderProduct < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.belongs_to :order, index: true
      t.belongs_to :product, index: true
      t.integer :units, null: false, default: 1
      t.float :unit_price, null: false
      t.timestamps
    end
  end
end

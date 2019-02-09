class CreateProduct < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false, default: ''
      t.float :price, null: false, default: 0.0
      t.integer :multiple, null: false, default: 0
      t.timestamps
    end
  end
end

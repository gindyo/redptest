class CreateInventoryProducts < ActiveRecord::Migration
  def change
    create_table :inventory_products do |t|
      t.string :name
      t.integer :available_count
      t.float :unit_price, scale: 2

      t.timestamps
    end
  end
end

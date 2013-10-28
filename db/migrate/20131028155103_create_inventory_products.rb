class CreateInventoryProducts < ActiveRecord::Migration
  def change
    create_table :inventory_products do |t|
      t.string :name
      t.integer :available_count
      t.integer :unit_price
    end
  end
end

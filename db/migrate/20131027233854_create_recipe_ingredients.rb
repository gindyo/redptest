class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.references :recipe
      t.string :name, null:false
      t.integer :required_units
    end
  end
end

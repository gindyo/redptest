require 'spec_helper'

describe Recipe do
  	it 'creates its ingredients' do
  		ingredient = RecipeIngredient.new name:'banana'
  		r = Recipe.create!(name:'espresso', recipe_ingredients:[ingredient])
  		RecipeIngredient.where(name:'banana').first.recipe_id.should eq r.id
	end
end

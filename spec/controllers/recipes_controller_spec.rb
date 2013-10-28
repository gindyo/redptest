require 'spec_helper'

describe RecipesController do 
	it 'creates new recipe with its ingredients' do
		post 'create', recipe: {name: 'banana split', recipe_ingredients: [{name: 'banana'},{name: 'icecream'}]}
		assigns :recipe

		Recipe.where(name: 'banana split').first.recipe_ingredients.first.name.should eq 'banana'
	end
end
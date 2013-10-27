require 'spec_helper'

describe RecipeIngredient do
	let(:ri){RecipeIngredient.new}
	it 'responds to :name' do 
		ri.should respond_to :name
	end
	it 'responds to :required_units' do
		ri.should respond_to :required_units
	end
	it 'responds to :recipe_id' do
		ri.should respond_to :recipe_id
	end

	
end
require 'spec_helper'
describe BeverageMaker do
	it 'responds to all' do 
		BeverageMaker.should respond_to :all
	end
	it 'returns all recipes' do
		r = BeverageMaker::RECIPE
		r.stub :all
		r.should receive :all
		BeverageMaker.all
	end
	
end
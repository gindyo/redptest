require 'spec_helper'
describe BeverageMaker do
	
	it 'responds to all' do 
		bm = BeverageMaker.new nil,nil,nil
		bm.should respond_to :all
	end
	it 'returns all beverages' do
		Recipe.stub(:all).and_return ['recipe']
		Beverage.stub(:new).and_return 'thisisbeverage'
		bm = BeverageMaker.new Recipe, Inventory, Beverage
		bm.all.should eq ['thisisbeverage']
	end

end
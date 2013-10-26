require 'spec_helper'
def responds_to m
	
end

describe BeverageMaker do
	
	let(:bm){BeverageMaker.new}
	
	it 'responds to :all' do 
		bm.should respond_to :all
	end
	it 'responds to :make' do
		bm.should respond_to(:make).with 1
	end
	it 'makes new beverage' do
		recipe = FactoryGirl.build :recipe
		inventory_prod = Struct.new(:name, :available_count, :unit_price)
		Inventory.stub(:where){inventory_prod.new('coffee', 10, 1 )}

	end
	it 'returns all beverages' do
		Recipe.stub(:all).and_return ['recipe']
		Beverage.stub(:new).and_return 'thisisbeverage'
		bm = BeverageMaker.new Recipe, Inventory, Beverage
		bm.all.should eq ['thisisbeverage']
	end



end
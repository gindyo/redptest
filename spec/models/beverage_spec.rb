require 'spec_helper'
def responds_to m
	r = FactoryGirl.build :recipe
	Beverage.new(r).should respond_to m
end
describe Beverage do
  it ' responds to price' do
  	responds_to :price
  end
  it ' responds to name' do 
  	responds_to :name
  end
  
  it 'calculates its price' do
    recipe = FactoryGirl.build :recipe 
    inventory = Inventory.stub(:price_for_products).with(recipe).and_return({coffe:1, shugar:2})
    b = Beverage.new recipe
    b.price.should eq 3
  end
end
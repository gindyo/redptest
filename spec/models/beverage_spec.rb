require 'spec_helper'
describe Beverage do
  it 'calculates its price' do
    recipe = FactoryGirl.build :recipe 
    inventory = Inventory.stub(:price_for_products).with(recipe).and_return({coffe:1, shugar:2})
    b = Beverage.new recipe
    b.price.should eq 3
  end
end
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
    rec_ingr1 = FactoryGirl.build :recipe_ingredient, {name: 'espresso',required_units: 2}
    rec_ingr2 = FactoryGirl.build :recipe_ingredient, {name: 'sugar', required_units: 2}
    
    ingr1 = FactoryGirl.create :inventory_product, {name: 'espresso', unit_price: 10}
    ingr2 = FactoryGirl.create :inventory_product, {unit_price: 5, name: 'sugar'}
    
    recipe = FactoryGirl.create :recipe, recipe_ingredients: [rec_ingr1, rec_ingr2] 
    b = Beverage.new recipe
    b.price.should eq 30
  end
end
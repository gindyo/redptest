require 'spec_helper'
include CustomExceptions
describe Inventory do
	let(:inv){Inventory.new}
	it 'responds to available_count' do
		inv.should respond_to :available_count
	end 
	it 'responds to name' do 
		inv.should respond_to :name 
	end

	it 'responds to unit_price' do 
		inv.should respond_to :unit_price 
	end
	before :each do 
		@coffee = FactoryGirl.build :inventory_product
		@sugar = FactoryGirl.build :inventory_product, {name: 'sugar', unit_price:2}
		Inventory.stub(:get_inventory_for) do |arg|
			if arg == 'coffee'
				@coffee
			elsif arg == 'sugar'
				@sugar 
			end
		end
		@recipe = FactoryGirl.build :recipe,{ingredients: [@coffee, @sugar]}
	end
	def espresso_recipe coffee, sugar
		coffe_ingredient = FactoryGirl.build( :recipe_ingredient, {name: 'coffee', required_units: coffee})
		sugar_ingredient = FactoryGirl.build( :recipe_ingredient, {name: 'sugar', required_units: sugar})
		FactoryGirl.build( :recipe, {ingredients: [coffe_ingredient, sugar_ingredient]})
	end
	describe 'check product inventory' do
		it 'throws an NoSufficientInventory exception' do
			recipe = espresso_recipe(@coffee.available_count+1, @sugar.available_count)
			expect {Inventory.check_inventory_for(recipe)}.to raise_exception NoSufficientInventory
		end
		it 'does NOT throw NoSufficientInventory exception' do 
			recipe = espresso_recipe(@coffee.available_count-1, @sugar.available_count)
			Inventory.check_inventory_for(recipe).should eq 'its all good'
	    end
	end
	
	it 'responds to :price_for_recipe_products' do 
		Inventory.price_for_recipe_products(@recipe).should eq @coffee.unit_price+@sugar.unit_price
	end

	it 'adjusts product availability' do 
		before = {coffee: @coffee.available_count, sugar: @sugar.available_count}
		Inventory.adjust_with espresso_recipe(2, 2)
		@coffee.available_count.should eq before[:coffee]-2
		@sugar.available_count.should eq before[:sugar]-2
	end


end
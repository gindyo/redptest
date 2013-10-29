require 'spec_helper'
include CustomExceptions
describe InventoryProduct do
	let(:inv){InventoryProduct.new}
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
		@recipe = FactoryGirl.create :recipe, name: :espresso
		FactoryGirl.create :recipe_ingredient, {name: 'coffee', recipe_id: @recipe.id, required_units: 2}
		FactoryGirl.create :recipe_ingredient, {name: 'sugar', recipe_id: @recipe.id, required_units: 2}
		@coffee = FactoryGirl.create :inventory_product, {name: 'coffee', unit_price: 1} 
		@sugar = FactoryGirl.create :inventory_product, {name: 'sugar', unit_price:2}
	end
	
	it 'returns a price given recipe' do
		InventoryProduct.price_for_recipe_products(@recipe).should eq 6
	end

	describe 'check product inventory' do
		it 'throws an NoSufficientInventory exception' do
			recipe = FactoryGirl.create :recipe, name: :capuchino
			FactoryGirl.create :recipe_ingredient, {name: 'coffee', recipe_id: recipe.id, required_units: 200}
			FactoryGirl.create :recipe_ingredient, {name: 'sugar', recipe_id: recipe.id, required_units: 200}
			expect {InventoryProduct.check_inventory_for(recipe)}.to raise_exception NoSufficientInventory
		end
		it 'does NOT throw NoSufficientInventory exception' do 
			InventoryProduct.check_inventory_for(@recipe).should eq 'its all good'
	    end
	end
	
	it 'adjusts product availability' do 
		before = {
			coffee: InventoryProduct.find_by(name:'coffee').available_count,
			sugar: InventoryProduct.find_by(name:'sugar').available_count
		}
		InventoryProduct.adjust_with @recipe
		InventoryProduct.where(name:'coffee').first.available_count.should eq before[:coffee]-2
		InventoryProduct.where(name:'sugar').first.available_count.should eq before[:sugar]-2
	end


end
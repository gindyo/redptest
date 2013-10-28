require 'spec_helper'
include CustomExceptions
describe BeverageMaker do
	
	let(:bm){BeverageMaker.new}
	before :each do
		@recipe = FactoryGirl.build(:recipe)
		Recipe.stub where: @recipe
		InventoryProduct.stub(:check_inventory_for)
		InventoryProduct.stub(:get_inventory_for)
		InventoryProduct.stub(:adjust_with)
	end
	it 'responds to :make' do
		bm.should respond_to(:make).with 1
	end
	describe 'makes new beverage' do 
		it 'checks for availability' do
			InventoryProduct.should receive :check_inventory_for
			bm.make :espresso
		end 
		
		it 'adjusts InventoryProduct' do
			InventoryProduct.should receive(:adjust_with).with @recipe
			bm.make :espresso
		end

		it 'does not adjusts inventory if no sufficient inventory' do
			InventoryProduct.stub :check_inventory_for do 
				raise NoSufficientInventory.new(nil,nil)
			end
			InventoryProduct.should_not receive(:adjust_with).with @recipe
			expect {bm.make :espresso}.to raise_exception NoSufficientInventory

		end
		it 'raises no such Recipe error' do
			Recipe.stub where: []
			expect {bm.make :tea}.to raise_exception NoSuchRecipe
		end

	end
	
end
require 'spec_helper'

describe Starbox do
	let(:sb){Starbox.new}
	it 'responds to :menu' do 
		sb.should respond_to :menu
	end

	it 'returns menue of beverages' do
		Recipe.stub(:all).and_return ['recipe1', 'recipe2']
		Beverage.stub(:new).and_return 'thisisbeverage'
		bm = BeverageMaker.new Recipe, Inventory, Beverage
		sb.menu.should eq ['thisisbeverage', 'thisisbeverage']
	end
	describe 'making beverage' do
		before :each do 
			Recipe.stub where: FactoryGirl.build(:recipe)
		end
		it 'makes a beverage' do
			Inventory.stub get_inventory_for: FactoryGirl.build(:inventory_product, {available_count: 20})
			sb.make(:espresso)
			sb.status.should eq sb.success_status :espresso
		end
		it 'does not make beverage' do
			Inventory.stub get_inventory_for: FactoryGirl.build(:inventory_product, {available_count: 0})
			sb.make(:espresso)
			sb.status.should eq sb.failure_status :espresso
		end
	end
end
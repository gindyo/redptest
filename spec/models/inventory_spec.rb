require 'spec_helper'
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
	
	it 'responds to :price_for_products'

end
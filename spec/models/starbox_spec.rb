require 'spec_helper'

describe Starbox do

	let(:sb){Starbox.new}
	before :each do 
		seed_db
	end
	it 'responds to :menu' do 
		sb.should respond_to :menu
	end

	it 'returns menue of beverages' do
		sb.menu.first.name.should be_in Recipe.all.map{|r|r.name}
	end
	describe 'making beverage' do
		it 'makes a beverage' do
			sb.make(:espresso)
			sb.status.should eq sb.success_status :espresso
		end
		it 'does not make beverage' do
			InventoryProduct.any_instance.stub available_count: 0
			sb.make(:espresso)
			sb.status.should eq sb.failure_status :espresso
		end
	end

end
require 'spec_helper'

describe RecipesController do 
	it 'adds_to_inventory' do
    post 'add_to_inventory'
    responce.should be :success
  end
end
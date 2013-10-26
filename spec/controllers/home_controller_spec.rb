require 'spec_helper'

describe HomeController do
  
  describe "GET 'index'" do
    before :each do 
      Recipe.stub(:all).and_return []
    end
    it "returns http success" do
      get 'index'
      response.should be_success
    end
    it 'gets the available beverages' do
      bm = BeverageMaker.new
      HomeController.any_instance.stub(:bm).and_return(bm)
      bm.should receive :all
    	get 'index'
    end
    
  end

end

require 'spec_helper'

describe HomeController do
  
  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
    it 'gets the available beverages' do
  		HomeController::BEVERAGES.should receive :all
    	get 'index'
    end
  end

end

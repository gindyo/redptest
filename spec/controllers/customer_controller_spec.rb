require 'spec_helper'

describe CustomerController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'buy'" do
    it "returns http success" do
      get 'buy'
      response.should be_success
    end
  end

end
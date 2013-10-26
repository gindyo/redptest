class HomeController < ApplicationController
  BEVERAGES = BeverageMaker.new nil,nil,nil
  
  def index
  	@beverages = BEVERAGES.all
  end
end

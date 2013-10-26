class HomeController < ApplicationController
  include BeverageMaker
  BEVERAGES = BeverageMaker
  
  def index
  	@beverages = BEVERAGES.all
  end
end

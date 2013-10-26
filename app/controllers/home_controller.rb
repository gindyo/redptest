class HomeController < ApplicationController
  def bm
  	BeverageMaker.new
  end

  def index
  	@beverages = bm.all
  end
end

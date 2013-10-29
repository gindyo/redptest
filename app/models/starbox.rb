class Starbox
	include CustomExceptions
	attr_accessor :menu, :status
    def success_status beverage
        "Thank you please enjoy your #{beverage}"
    end
    def failure_status beverage
        "Sorry – we are temporarily unable to dispense #{beverage}. Please make another selection."
    end


	def initialize beverage_maker = BeverageMaker.new, inventory_class= InventoryProduct, recipes_class=Recipe, beverage_class = Beverage
		@beverage_maker = beverage_maker
		@inventory_class = inventory_class
		@recipes_class = recipes_class
		@beverage_class = beverage_class
	end

	def menu
    	all = []
    	@recipes_class.all.each do |r| 
    	  all<< @beverage_class.new(r)
    	end
    	all
  	end

    def make beverage
    	begin
    		@beverage_maker.make beverage
    		@status = success_status beverage
    	rescue NoSufficientInventory
    		@status = failure_status beverage
        rescue NoSuchRecipe
            @status = 'No recipe found'
    	end
    end



end
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
        @status = {}
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
    		@status[:message] = success_status beverage
            @status[:code] = 'ok'
    	rescue NoSufficientInventory
    		@status[:message] = failure_status beverage
            @status[:code] = 'error'
        rescue NoSuchRecipe
            @status[:message] = 'No recipe found'
            @status[:code] = 'error'
    	end
    end



end
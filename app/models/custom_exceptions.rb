module CustomExceptions
	class NoSufficientInventory < StandardError
		attr_accessor :product, :current_count
		def initialize product, current_count
			@product=product
			@current_count=current_count
			
		end
	end
	class NoSuchRecipe <StandardError

	end
end
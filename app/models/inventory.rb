class Inventory
	include CustomExceptions
	attr_accessor :name, :available_count, :unit_price, :id
	def self.price_for_recipe_products recipe
		price = 0.0

		recipe.ingredients.each do |ingredient|
       i = get_inventory_for(ingredient.name)
       price += i.unit_price 
     end
		price
	end
    def self.check_inventory_for recipe
    	recipe.ingredients.each do |ingredient|
    		inventory = get_inventory_for(ingredient.name)
    		if inventory.available_count < ingredient.required_units
    			raise NoSufficientInventory.new(ingredient, inventory.available_count)
    		end
    	end
    	'its all good' #return value is only for testing purpose
    end
   	def self.adjust_with recipe
      recipe.ingredients.each do |ingredient|
        inventory = get_inventory_for(ingredient.name)
        inventory.available_count -= ingredient.required_units
      end
    end




    def self.get_inventory_for product
   		raise 'Not Implemented'
   	end
		
end
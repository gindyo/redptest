class InventoryProduct < ActiveRecord::Base
	include CustomExceptions
	MAX_COUNT = 25
  validates :name , presence: true
  belongs_to :recipe_ingredient, foreign_key: 'name'


  def restock
    all_inventory.each do |i|
      i.update available_count: MAX_COUNT
    end
  end


  def self.price_for_recipe_products recipe
		price = 0.0
    recipe.recipe_ingredients.each do |ingredient|
       i = get_inventory_for(ApplicationHelper.caps ingredient.name)#caps is defined in application_helper
       price += i.unit_price*ingredient.required_units unless i.nil?
     end
		price
	end
    def self.check_inventory_for recipe
    	recipe.recipe_ingredients.each do |ingredient|
        inventory = get_inventory_for(ingredient.name)
    		if inventory && inventory.available_count < ingredient.required_units
    			raise NoSufficientInventory.new(ingredient, inventory.available_count)
    		end
    	end
    	'its all good' #return value is only for testing purpose
    end
   	def self.adjust_with recipe
      recipe.recipe_ingredients.each do |ingredient|
        inventory = get_inventory_for(ingredient.name)
        available = inventory.available_count
        inventory.update available_count: (available - ingredient.required_units)
      end
    end

    def self.get_inventory_for product_name
      fake = Struct.new(:available_count)
   		self.find_by(name:product_name) || fake.new(0)
   	end
		def self.all_inventory
      self.all
    end
end

class BeverageMaker
  include CustomExceptions
  attr_accessor :recipes, :inventory, :beverage_class
  def initialize recipes_class=Recipe, inventory_class=Inventory, beverage_class=Beverage
    @recipes = recipes_class 
    @inventory = inventory_class
    @beverage_class = beverage_class
  end
  def make name
    recipe = @recipes.where(name: name) 
    raise NoSuchRecipe if recipe.blank?
    @inventory.check_inventory_for recipe #will throw exception if no sufficient inventory
    @inventory.adjust_with(recipe)
  end

end
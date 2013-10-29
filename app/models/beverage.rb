class Beverage
  attr_accessor :recipe, :name
  def initialize recipe, inventory_class=InventoryProduct
    @recipe = recipe
    @inventory_class = inventory_class
  end
  def price 
    @inventory_class.price_for_recipe_products(@recipe)
  end
  def name
    @recipe.name
  end


end
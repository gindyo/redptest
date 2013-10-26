
class BeverageMaker
  attr_accessor :recipes, :inventory, :beverage_class
  def initialize recipes_class, inventory_class, beverage_class
    @recipes = recipes || Recipe
    @inventory = inventory || Inventory
    @beverage_class = beverage_class || Beverage
  end
  def all
    all = []
    recipes.all.each do |r| 
      all<< beverage_class.new(r)
    end
    all
  end

end
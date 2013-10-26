
class BeverageMaker
  attr_accessor :recipes, :inventory, :beverage_class
  def initialize recipes_class=Recipe, inventory_class=Inventory, beverage_class=Beverage
    @recipes = recipes_class 
    @inventory = inventory_class
    @beverage_class = beverage_class
  end
  def all
    all = []
    recipes.all.each do |r| 
      all<< beverage_class.new(r)
    end
    all
  end
  def make name
    
  end

end
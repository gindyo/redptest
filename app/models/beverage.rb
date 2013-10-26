class Beverage
  attr_accessor :recipe
  def initialize recipe, inventory_class=Inventory
    @recipe = recipe
    @inventory_class = inventory_class
  end
  def price 
    total_price = 0.0
    @inventory_class.price_for_products(@recipe).map{|k,v| total_price += v }
    total_price
  end

end
require 'inventory_product'
module RecipesHelper
  def product_names
    InventoryProduct.all.map{|product| product.name.split.map(&:capitalize).join(' ')}
  end
  def inventory_product
    InventoryProduct.new
  end
  def caps words
    ApplicationHelper.caps words
  end
end

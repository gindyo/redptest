require 'modules/my_helpers'
require 'inventory_product'
module RecipesHelper
  include MyHelpers
  def product_names
    InventoryProduct.all.map{|product| product.name.split.map(&:capitalize).join(' ')}
  end
  def inventory_product
    InventoryProduct.new
  end
end

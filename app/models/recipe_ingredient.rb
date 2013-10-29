class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  has_one :inventory_product, primary_key: 'name', foreign_key: 'name'
  def capped_name
    MyHelpers::caps @name
  end
end

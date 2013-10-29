class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :inventory_products, through: :recipe_ingredients
  accepts_nested_attributes_for :recipe_ingredients
end
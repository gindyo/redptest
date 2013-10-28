class Recipe < ActiveRecord::Base
  attr_writer :recipe_ingredients
  has_many :recipe_ingredients
  before_save :split_params 
  def split_params 
    recipe_ingredients.each do |i| 
      ingr = RecipeIngredient.where(i).first_or_create
      ingr.save!
    end
  end
end
require 'factory_girl'

FactoryGirl.define do
  factory :recipe_ingredient do
    id 1
    recipe_id 1
    name 'coffee'
    required_units 2 
  end

  coffee = FactoryGirl.build :recipe_ingredient
  sugar = FactoryGirl.build :recipe_ingredient, {name: sugar}
  factory :recipe do 
    id 1
    name 'esspreso'
    ingredients [coffee, sugar]
  end

  factory :inventory_product, class: Inventory do
  	id 1
  	name 'coffee'
  	available_count 10
  	unit_price 1
  end
end
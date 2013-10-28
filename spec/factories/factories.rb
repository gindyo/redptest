require 'factory_girl'

FactoryGirl.define do
  factory :recipe_ingredient do
    name 'coffee'
    required_units 2 
  end
  factory :recipe do 
    name 'esspreso'
  end

  factory :inventory_product do
   	name 'coffee'
  	available_count 10
  	unit_price 1

  end
end
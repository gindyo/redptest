require 'factory_girl'

FactoryGirl.define do
  factory :recipe do 
    id 1
    name 'esspreso'
    ingredients ['coffee', 'shugar']
  end

  factory :inventory_product, class: Inventory do
  	id 1
  	name 'coffee'
  	available_count 10
  	unit_price 1
  end
end
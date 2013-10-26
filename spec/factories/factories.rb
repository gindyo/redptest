require 'factory_girl'

FactoryGirl.define do
  factory :recipe do 
    id 1
    name 'esspreso'
    ingredients ['coffee', 'shugar']

  end
end
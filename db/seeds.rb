# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html


cafe_americano = Recipe.create({
	name: 'Cafe Americano',
	recipe_ingredients:[
		RecipeIngredient.new(name:'espresso', required_units:3)
	]
})
cafe_late = Recipe.create({
	name: 'Cafe Late',
	recipe_ingredients:[
		RecipeIngredient.new(name:'espresso', required_units:2),
		RecipeIngredient.new(name:'steamed milk', required_units:1)
	]
})
cafe_moca = Recipe.create({
	name: 'Cafe Moca',
	recipe_ingredients:[
		RecipeIngredient.new(name:'espresso', required_units:1),
		RecipeIngredient.new(name:'cocoa', required_units:1),
		RecipeIngredient.new(name:'whipped cream', required_units:1),
		RecipeIngredient.new(name:'steamed milk', required_units:1)
	]
	})
cappuccino = Recipe.create({
	name: 'Cappuccino',
	recipe_ingredients:[
		RecipeIngredient.new(name:'espresso', required_units:1),
		RecipeIngredient.new(name:'foamed milk', required_units:1),
		RecipeIngredient.new(name:'steamed milk', required_units:1)
]})
caffee = Recipe.create({
	name: 'Coffee',
	recipe_ingredients:[
		RecipeIngredient.new(name:'coffee', required_units:3),
		RecipeIngredient.new(name:'sugar', required_units:1),
		RecipeIngredient.new(name:'cream', required_units:1)
]})
decaf_caffee = Recipe.create({
	name: 'Decaf Coffee',
	recipe_ingredients:[
		RecipeIngredient.new(name:'decaf coffee', required_units:3),
		RecipeIngredient.new(name:'sugar', required_units:1),
		RecipeIngredient.new(name:'cream', required_units:1)
]})

for k,v in {
'Cocoa'=>0.90,
'Coffee'=>0.75,
'Cream'=>0.25,
'Decaf Coffee'=>0.75,
'Espresso'=>1.10,
'Foamed Milk'=>0.35,
'Steamed Milk'=>0.35,
'Sugar'=>0.25,
'Whipped Cream'=>1.00,
}
	InventoryProduct.create({name: k, available_count: 25, unit_price: v})
end

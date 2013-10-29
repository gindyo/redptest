Redptest::Application.routes.draw do
  resources :inventory_products

  post '/recipes/:id/add_ingredient', to:'recipes#add_ingredient', as: :add_recipe_recipe_ingredient
  post '/recipes/:id/add_to_inventory', to:'recipes#add_to_inventory'
  
  resources :recipes do
    resources :recipe_ingredients
  end
  resource :inventory_products
  root 'starboxes#front_face'
end

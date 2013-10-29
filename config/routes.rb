Redptest::Application.routes.draw do
  resources :inventory_products

  resources :recipes do
    resources :recipe_ingredients
  end
  resource :inventory_products
  get '/starbox/make/:beverage'=>"starbox#make"
  root 'starbox#front_face'
  post '/recipes/:id/add_ingredient', to:'recipes#add_ingredient', as: :add_recipe_recipe_ingredient
  post '/recipes/:id/add_to_inventory', to:'recipes#add_to_inventory'
  post '/inventory/restock', to: 'inventory_products#restock', as: :restock_inventory_url
  
end

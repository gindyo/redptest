Redptest::Application.routes.draw do
  resources :inventory_products
  root 'starbox#front_face'

  resources :recipes do
    resources :recipe_ingredients
  end
  resource :inventory_products
  post '/', to:'starbox#front_face'
  get '/starbox/make/:beverage'=>"starbox#make"
  post '/recipes/:id/add_ingredient', to:'recipes#add_ingredient', as: :add_recipe_recipe_ingredient
  post '/recipes/:id/add_to_inventory', to:'recipes#add_to_inventory'
  post '/inventory/restock', to: 'inventory_products#restock', as: :restock_inventory_url
  
end

Redptest::Application.routes.draw do
  post '/recipes/:id/add_ingredient', to:'recipes#add_ingredient', as: :add_recipe_recipe_ingredient
  resources :recipes do
    resources :recipe_ingredients
  end
  resource :inventory_products
  root 'starboxes#front_face'
end

Redptest::Application.routes.draw do
  resources :recipes
  resources :recipe_ingredients
  root 'starboxes#front_face'
end

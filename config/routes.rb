Redptest::Application.routes.draw do
  resources :starboxes

	root 'home#index'
end

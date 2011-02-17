Seefood::Application.routes.draw do
  resources :restaurants do
    resources :menu_items
  end
  get "home/index"
  get "restaurant/index"

  root :to => "restaurants#index"
end

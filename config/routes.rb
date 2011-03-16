Seefood::Application.routes.draw do
  resources :restaurants

  match "/reviews/:menu_item_id/new" => "reviews#new", :as => "new_review", :via => "get"
  resources :reviews, :except => [:index, :new]

  match "/menu_items/:restaurant_id/new" => "menu_items#new", :as => "new_menu_item", :via => "get"
  resources :menu_items, :except => [:index]

  root :to => "restaurants#index"
end

Seefood::Application.routes.draw do
  resources :menu_items, :only => [:show, :destroy]

  resources :restaurants do
    resources :reviews, :except => [:index]
  end

  get "home/index"
  get "restaurant/index"

  root :to => "restaurants#index"
end

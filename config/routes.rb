Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Favorites routes
  resources :resources do
    resources :favorites, only: [:create, :destroy]
  end

  root to: "resources#index"

  #Sessions routes
  resources :sessions, only: [:create, :new]
  delete 'sessions', to: 'sessions#logout'

  #Users routes
  resources :users

  #Resources routes
  resources :resources
  get '/resources/search', to: 'resources#search', as: 'search_resources'

  #Tags routes
  resources :resources do
    resources :resource_tags, only: [:new, :create]
  end

  #Resource_tags routes
  resources :resource_tags, only: [:create, :destroy]
end

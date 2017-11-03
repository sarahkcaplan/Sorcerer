Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Favorites routes
  resources :resources do
    resources :favorites, only: [:create, :destroy]
  end
  resources :favorites, only: [:index]

  root to: "resources#index"

  #Sessions routes
  resources :sessions, only: [:create, :new]
  delete 'sessions', to: 'sessions#logout'

  #Users routes
  resources :users
  get '/users/:user_id/my_resources', to: 'users#teachers_my_show', as: 'my_resources'

  #Resources routes
  resources :resources
  post '/resources/search', to: 'resources#search', as: 'search_resources'


  #Tags routes
  resources :resources do
    resources :resource_tags, only: [:new, :create]
  end

  #Resource_tags routes
  resources :resource_tags, only: [:create, :destroy]
end
